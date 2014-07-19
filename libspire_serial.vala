//
//
//  Author:
//       Edwin De La Cruz <admin@edwinspire.com>
//
//  Copyright (c) 2011 edwinspire
//  Web Site http://edwinspire.com
//
//  Quito - Ecuador
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
using GLib;
/////
/// Import of external serial port handling Multiplatform functions.
/// These come from serial.c external functions depending on the operating system for which it has been compiled
/////
extern int Open_Port(string Puerto);
extern int Set_Configure_Port(int fd, uint BaudRate, uint Bits, uint Parity, uint BitsStop);
extern long Write_Port(int fd, string buf, int SizeData);
extern char Getc(int fd);
extern int Kbhit_Port(int fd);
extern int Close_Port(int fd);
extern int Set_Hands_Haking(int fd, int FlowControl);
extern int IO_Blocking(int fd, int Modo);
extern int Clean_Buffer(int fd);
extern int Setup_Buffer(int fd,  ulong InQueue, ulong OutQueue);
extern int Set_Time(int fd, uint Time);

namespace edwinspire {


	namespace Ports {
	

		/** 
        * Configuration parameters of the serial port
        */
		public class Configure:GLib.Object {
	    	/** 
            * Serial Port
            *
            * Example on Windows: COM1 <<BR>>
            * Example on Linux: / dev/ttyS0
            */		
			public string Port {
				set;
				get;
				default = "/dev/ttyS0";
			}
			public uint BaudRate {
				get;
				set;
				default = 9600;
			}
			public Parity Parityp {
				get;
				set;
				default = Ports.Parity.NONE;
			}
			public StopBits StopBitsp {
				get;
				set;
				default = Ports.StopBits.ONE;
			}
			public uint DataBits {
				get;
				set;
				default = 8;
			}
			public HandShaking HandShake {
				get;
				set;
				default = Ports.HandShaking.NONE;
			}
			
		/** 
        * Serial port enabled
        *
        * If this value is set to FALSE the serial port is disabled and can not work with him.
        */
			public bool Enable {
				set;
				get;
				default = true;
			}
			public ulong BufferIn {
				set;
				get;
				default = 8192;
			}
			public ulong BufferOut {
				set;
				get;
				default = 8192;
			}
			public Configure() {
			}
		}
		

		/** 
        * Class for handling serial communication port
        */
		public class SerialPort:Configure {
		
    		/** 
            * Signal output indicating the status of data transmission
            */
			public signal void Status(DataStatus Status);
			private int Gestor = -1;
			private bool Bloqueante = false;
			// Variables para uso interno
			private Timer TemporizadorInternoReadChar = new Timer();
			private Timer TemporizadorInternoReadLine = new Timer();
			private StringBuilder LineaModem = new StringBuilder();
    		/** 
            * Enables writing a log of transactions performed by the modem.
            */
			public bool LogModem{public set; default = false; public get;}
    		/** 
            * Constructor with arguments
            */			
			public SerialPort.with_args(string Port_ = "/dev/ttyS0", uint Baudrate = 2400, uint DataBits = 8, Parity Parity_ = Parity.NONE, StopBits StopBits_ = StopBits.ONE, HandShaking HS_ = HandShaking.NONE) {
				connectSignals();
				Port = Port_;
				this.BaudRate = Baudrate;
				this.Parityp =  Parity_;
				this.StopBitsp = StopBits_;
				this.DataBits = DataBits;
				this.HandShake = HS_;
			}
			private void connectSignals() {
				// Realizamos la accion cuando el Baudrate cambia
				this.notify["BaudRate"].connect((objeto, parametros)=> {
					Set_Port();
				}
				);
				this.notify["Parity"].connect((objeto, parametros)=> {
					Set_Port();
				}
				);
				this.notify["StopBits"].connect((objeto, parametros)=> {
					Set_Port();
				}
				);
				this.notify["DataBits"].connect((objeto, parametros)=> {
					Set_Port();
				}
				);
				this.notify["HandShake"].connect((objeto, parametros)=> {
					set_handshaking();
				}
				);
				this.notify["BufferIn"].connect((objeto, parametros)=> {
					Setup_Buffer_(this.BufferIn, this.BufferOut);
				}
				);
				this.notify["BufferOut"].connect((objeto, parametros)=> {
					Setup_Buffer_(this.BufferIn, this.BufferOut);
				}
				);
			}
    		/** 
            * Default Constructor
            *
            * Port = "/dev/ttyS0" <<BR>>
            * Enable = true
            */				
			public SerialPort() {
				this.connectSignals();
				this.Port = "/dev/ttyS0";
				this.Enable = true;
			}
			// Configure port with arguments
			private bool Set_Port() {
				bool Retorno = false;
				if(this.IsEnableAndOpen()) {
					if(Set_Configure_Port(Gestor, this.BaudRate, this.DataBits, this.Parityp, this.StopBitsp) == 0) {
						Retorno = true;
					} else {
						Retorno = false;
					}
				}
				return Retorno;
			}
			// Set port with full arguments
			private bool Set() {
				bool Retorno = false;
				if(Enable && Set_Port()) {
					if(set_handshaking()) {
						Retorno = IO_Blocking_();
					}
				}
				return Retorno;
			}
			// Configure buffer of port
			private bool Setup_Buffer_(ulong BufferIn, ulong BufferOut) {
				bool Retorno = false;
				if(this.IsEnableAndOpen() && Setup_Buffer(Gestor, BufferIn, BufferOut)==0) {
					Retorno = true;
				}
				return Retorno;
			}
			// Set HandSHaking
			private bool set_handshaking() {
				bool Retorno = false;
				if(this.IsEnableAndOpen()) {
					if(Set_Hands_Haking(Gestor, this.HandShake) == 0) {
						Retorno = true;
					}
				}
				return Retorno;
			}
    		/** 
            * Discards data from buffer
            * @return TRUE if all went well, otherwise it returns FALSE.
            */				
			public bool DiscardBuffer() {
				bool Retorno = false;
				if(this.IsEnableAndOpen() && Clean_Buffer(Gestor) == 0) {
					Retorno = true;
				}
				return Retorno;
			}
			//TODO//
			/**
			* ''Warning:'' do not use this method, not yet implemented.
			*/
			public string[] Get_PortName() {
				string[] Retorno = new string[0];
				return Retorno;
			}
			/**
			* Sets whether reading and writing data will run in blocking mode.
			*/
			public bool Blocking {
				set {
					Bloqueante = value;
					IO_Blocking_();
				}
				get {
					return Bloqueante;
				}
			}
			private bool IO_Blocking_() {
				bool Retorno = false;
				int Valor = -1;
				if(Bloqueante) {
					Valor = 0;
				}
				if(this.IsEnableAndOpen() && IO_Blocking(Gestor, Valor) == 0) {
					Retorno = true;
				}
				return Retorno;
			}
			/**
			* Maximum time in milliseconds between consecutive characters
			*/
			public bool Time(uint Time_) {
				bool Retorno = false;
				if(this.IsEnableAndOpen() && Set_Time(Gestor, Time_) == 0) {
					Retorno = true;
				}
				return Retorno;
			}
			
            /**
            * Bytes to read
            */
			public int BytesToRead {
				get {
					return Kbhit_Port(Gestor);
				}
			}
			
			/**
			* Open port
			* @return TRUE if all went well, otherwise it returns FALSE.
			*/
			public bool Open() {
				var Cadena = new StringBuilder();
				if(LogModem) {
					Cadena.append_printf("Port: %s\n", this.Port);
					Cadena.append_printf("Open configuration: %s\n", this.Port);
					Cadena.append_printf("Baud rate: %s\n", this.BaudRate.to_string());
					Cadena.append_printf("Parity: %s\n", this.Parityp.to_string());
					Cadena.append_printf("Stop Bits: %s\n", this.StopBitsp.to_string());
					Cadena.append_printf("Data Bits: %s\n", this.DataBits.to_string());
					Cadena.append_printf("HandShake: %s\n", this.HandShake.to_string());
					LogCommandAT(Cadena.str);
				}
				//TODO//Crear un TimeOut para Open
				Gestor = Open_Port(Port);
				if(Enable && IsOpen) {
					Set();
				} else {
					stderr.printf("The port %s could not be opened\n", this.Port);
					if(LogModem) {
						Cadena.truncate(0);
						Cadena.append_printf("The port %s could not be opened\n", this.Port);
						LogCommandAT(Cadena.str);
					}
				}
				return this.IsOpen;
			}
			
			/**
			* Writes the data to the port
			*
			* @return Number of bits
			*/
			public long Write(string data_) {
				long Retorno = 0;
				var Cadena = new StringBuilder();
				if(LogModem) {
					Cadena.append_printf(">> %s\n", data_);
					LogCommandAT(Cadena.str);
				}
				if(this.IsEnableAndOpen()) {
					if(data_.length>0) {
						StringBuilder DatoC = new StringBuilder();
						int i = 0;
						this.Status(DataStatus.Sending);
						while(i<data_.length) {
							DatoC.truncate(0);
							DatoC.append_unichar(data_[i]);
							this.PausaEntreBytes();
							if(Write_Port(Gestor, DatoC.str, 1) == 1) {
								Retorno++;
							} else {
								warning("Failed to write (%s)\n", DatoC.str);
							}
							i++;
						}
					}
				}
				this.Status(DataStatus.None);
				return Retorno;
			}
			
			internal bool IsEnableAndOpen() {
				bool Retorno = false;
				if(Enable) {
					if(IsOpen) {
						Retorno = true;
					} else {
						stderr.printf("(IsEnableAndOpen) Port %s is not open\n", this.Port);
					}
				} else {
					stderr.printf("(IsEnableAndOpen) Port %s is not enabled\n", this.Port);
				}
				return Retorno;
			}
			
			/**
			* Read char from port
			* @return A char or 0
			*/
			public char ReadChar() {
				char Datax = 0;
				// Espera un tiempo hasta que lleguen los datos, caso contrario sale y genera una exepcion
				if(this.IsEnableAndOpen()) {
					if(this.BytesToReadInternal()) {
						this.Status(DataStatus.Receiving);
						Datax = Getc(Gestor);
					}
				}
				this.Status(DataStatus.None);
				stdout.printf ("%c", Datax);
				return Datax;
			}
			internal void PausaEntreBytes() {
				Thread.usleep((ulong)this.BaudRateTouseg());
			}
			// Consulta al modem si hay bits para leer, si se exede el timeout de espera se genera una exepcion.
			internal bool BytesToReadInternal() {
				bool Retorno = false;
				if(this.IsEnableAndOpen() && this.BytesToRead<1) {
					int intentos = 0;
					Retorno = true;
					TemporizadorInternoReadChar.start();
					while(!(this.BytesToRead>0) && intentos<5) {
						PausaEntreBytes();
						PausaEntreBytes();
					intentos++;
					}
				} else {
					Retorno = true;
				}
				TemporizadorInternoReadChar.stop();
				return Retorno;
			}
			
			/**
			* Write log from modem
			* 
			* File modem.log <<BR>>
			* ''Warning:'' Do not use this method, it is not fully implemented.
			*/
			// TODO Mejorar este metodo
			public static void LogCommandAT (string text = "") {
				try {
					// an output file in the current working directory
					var file = File.new_for_path ("modem.log");

					// creating a file and a DataOutputStream to the file
					/*
            Use BufferedOutputStream to increase write speed:
        */
					var dos = new DataOutputStream (file.append_to (FileCreateFlags.NONE));
					// writing a short string to the stream
					//     dos.put_string ("this is the first line\n");
					//   string text = "this is the second line\n";
					// For long string writes, a loop should be used, because sometimes not all data can be written in one run
					// 'written' is used to check how much of the string has already been written
					uint8[] data = text.data;
					long written = 0;
					while (written < data.length) {
						// sum of the bytes of 'text' that already have been written to the stream
						written += dos.write (data[written:data.length]);
					}
				}
				catch (Error e) {
					stderr.printf ("%s\n", e.message);
				}
			}
			
			/**
			* Returns the microseconds Baudrate turned into
			*/
			public double BaudRateTouseg() {
				var Retorno = ((1/(double)this.BaudRate)*1000000);
				return Retorno;
			}
			/**
			* Returns the milliseconds Baudrate turned into
			*/			
			public double BaudRateTomseg() {
				var Retorno = ((1/(double)this.BaudRate)*1000);
				return Retorno;
			}
			/**
			* Read data port until find \r\n (not included)
			* @param timeout_ms_for_line Time in milliseconds that the software will wait for a line. <<BR>>
			* You can increase this value if you have problems with the device. <<BR>>
			* The defualt value is 0.
			* @return Returns the line read (without \r\n) or ''null'' if not obtained some data.
			*/			
			public string? ReadLine(double timeout_ms_for_line = 0) {
				return Strip(ReadLine(timeout_ms_for_line));
			}
			
			/**
			* Read data port until find \r\n. 
			* @param timeout_ms_for_line Time in milliseconds that the software will wait for a line. <<BR>>
			* You can increase this value if you have problems with the device. <<BR>>
			* The defualt value is 0.
			* @return Returns the line read or ''null'' if not obtained some data.
			*/	
			public string? ReadLineWithoutStrip(double timeout_ms_for_line = 0) {
				bool AnyCharValid = false;
				LineaModem.truncate(0);
				if(this.IsEnableAndOpen()) {
					TemporizadorInternoReadLine.start();
					if(timeout_ms_for_line<1) {
						timeout_ms_for_line = (this.BaudRateTomseg()+1)*200;
					}
					char C = 0;
					bool EncontradoFinDeLinea = false;
					while(!EncontradoFinDeLinea) {
						if((TemporizadorInternoReadLine.elapsed()*1000)>timeout_ms_for_line) {
							warning("[ReadLineWithoutStrip] Timeout to End Line, limit %s ms\n", timeout_ms_for_line.to_string());
							EncontradoFinDeLinea = true;
							break;
						}
						if(LineaModem.str.has_suffix("\r\n")) {
							EncontradoFinDeLinea = true;
						} else {
							C = ReadChar();
							if(C>0) {
								AnyCharValid=true;
								LineaModem.append_c(C);
							}
						}
					}
				}
				TemporizadorInternoReadLine.stop();
				string ? Retorno = null;
				if(AnyCharValid) {
					Retorno = LineaModem.str;
				}
				if(LogModem) {
					var Cadena = new StringBuilder();
					Cadena.append_printf("<< %s\n", Retorno);
					LogCommandAT(Cadena.str);
				}
				LineaModem.truncate(0);
				return Retorno;
			}
			
			/**
			* Strip string
			*/
			public static string Strip(string String) {
				return String.strip();
			}
			
			/**
			* Close port
			*/
			public bool Close() {
				bool Retorno = false;
				if(IsOpen) {
					if(Close_Port(Gestor) == 0) {
						Retorno = true;
						Thread.usleep(100000);
					} else if(Close_Port(Gestor) == 0) {
						Retorno = true;
						Thread.usleep(100000);
					} else if(Close_Port(Gestor) == 0) {
						Retorno = true;
						Thread.usleep(100000);
					}
					Gestor = -1;
				}
				return Retorno;
			}
			
			/**
			* Port is open
			*/
			public bool IsOpen {
				get {
					bool Retorno = false;
					if(Gestor>0) {
						Retorno = true;
					}
					return Retorno;
				}
			}
		}
	}
}
