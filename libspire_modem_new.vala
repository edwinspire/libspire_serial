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
using Gee;
namespace edwinspire {
	namespace Ports {
	

			/** 
            * Response From Modem
            */
		public class Response:GLib.Object {
			public CME CMEError = CME.None;
			public CMS CMSError = CMS.None;
	
			/**
			* Response to AT command sent
			*/
			public ResponseCode Return = ResponseCode.UNKNOW;
			
			/**
			* Raw data
			*/
			public string Raw = "";
			
			/**
			* Lines received in response to AT Command
			*/
			public ArrayList<string> Lines  = new ArrayList<string>();
			
			/**
			* Constructor with parameter
			*/
			public Response.with_args(ResponseCode Return, ArrayList<string> Lines, string raw, CME cmeError = CME.None, CMS cmsError = CMS.None) {
				this.Return = Return;
				this.Lines = Lines;
				this.Raw = raw;
				this.CMEError = cmeError;
				this.CMSError = cmsError;
			}
    
    		/**
            * Default constructor
            */
			public Response() {
			}
			
			public string ToString() {
				var Cadena = new StringBuilder();
				foreach(var l in this.Lines) {
					Cadena.append_printf("%s\n", l);
				}
				Cadena.append_printf("Modem %s Response:\n", Return.to_string());
				return Cadena.str;
			}
		}
		
		/**
		* Data structure that represents the data from the last call received
		*/
		public struct LastCallReceived {
		    /**
		    * Phone number
		    */
			public string Number;
			/**
			* Date and time of the telephone call
			*/
			public DateTime Date;
			/**
			* The record was received
			*/
			public bool Read;
			public LastCallReceived() {
				this.Number = "";
				this.Date = new DateTime.now_local ();
				this.Read = false;
			}
		}
		
		
		/**
		* Represents a Modem resource.
		*/
		[Description(nick = "Modem", blurb = "Represents a Modem resource")]
		public class Modem : SerialPort {
			private string[] expregOK = {
				"OK\r\n"
			}
			;
			private string[] expregERROR = {
				"ERROR\r\n"
			}
			;
			// Message service error
			private string[] expregERROR_CMS = {
				"""\+CMS ERROR: (?<Error>[0-9|a-z|AZ|\w| ]+)""",
				"\\+CMS ERROR: (?<Error>[0-9]+)"
			}
			;
			private string[] expregERROR_CMEE = {
				"""\+CME ERROR: (?<Error>[0-9|a-z|AZ|\w| ]+)""",
				"\\+CME ERROR: (?<Error>[0-9]+)"
			}
			;
			private string[] expregCLIP = {
				"\\+CLIP: \"(?<CLIP>[0-9|+]+)\""
			}
			;
			/**
			* Represents the data from the last call received
			*/
			public LastCallReceived LastCall = LastCallReceived();
			//--Señales--//
			/**
			* Emits a signal with the phone number of an incoming call
			*/
			[Description(nick = "CallID", blurb = "Emits a signal with the phone number of an incoming call")]
			public signal void CallID(string Number);
			/**
			* Emits a signal when it has detected that the modem is ringing for an incoming call
			*/
			[Description(nick = "Ringing", blurb = "Emits a signal when it has detected that the modem is ringing for an incoming call")]
			public signal void Ringing();
			private Timer Temporizador = new Timer();
			
			/**
			* Default constructor
			*/
			public Modem() {
			}

            /**
            * Attempts to detect the most suitable for the modem Baudrate
            */
			[Description(nick = "AutoBaudRate", blurb = "Attempts to detect the most suitable for the modem Baudrate")]
			public uint AutoBaudRate() {
				uint oldbaudrate = this.BaudRate;
				uint Retorno = this.BaudRate;
				bool oldOpen = this.IsOpen;
				bool detectado = false;
				uint[] baudios = {
					100, 200, 300, 600, 1200, 1800, 2400, 4800, 9600, 19200, 38400, 115200, 230400, 460800
				}
				;
				this.Close();
				foreach(var v in baudios) {
					this.BaudRate = v;
					this.Open();
					print("Test Baudrate: %s\n", v.to_string());
					this.DiscardBuffer();
					if(this.AT()) {
						print("Baudrate a %s = OK\n", v.to_string());
						Retorno = v;
						detectado = true;
						break;
					}
					this.Close();
				}
				if(!detectado) {
					this.BaudRate = oldbaudrate;
				}
				if(oldOpen) {
					this.Open();
				} else {
					this.Close();
				}
				return Retorno;
			}
			
			/**
			* Receives the answer modem
			*/
			[Description(nick = "Receive", blurb = "Receives the answer modem")]
			public Response Receive(double waitforresponse_ms = 0, bool preventDetectFalseResponse = false) {
				var RespuestaEnBruto = new StringBuilder();
				if(waitforresponse_ms<100) {
					waitforresponse_ms = waitforresponse_ms+(this.BaudRateTomseg()*750);
				}
				ArrayList<string> ModemReadLines = new ArrayList<string>();
				var Respuesta = ResponseCode.UNKNOW;
				if(this.IsOpen && this.Enable) {
					Temporizador.start();
					string? linea = "";
					bool identificado = false;
					while(Respuesta == ResponseCode.UNKNOW) {
						identificado = false;
						if(Temporizador.elapsed()*1000>waitforresponse_ms) {
							warning("[Receive] Timeout response modem, limit %s ms\n", waitforresponse_ms.to_string());
							break;
						}
						linea = this.ReadLineWithoutStrip();
						if(linea!=null) {
							identificado = false;
							// Detecta si la linea es OK
							foreach(string Expresion in expregOK) {
								try {
									Regex RegExp = new Regex(Expresion);
									MatchInfo match;
									if(RegExp.match(linea, RegexMatchFlags.ANCHORED, out match)) {
										Respuesta = ResponseCode.OK;
										RespuestaEnBruto.append(linea);
										identificado = true;
										break;
									}
								}
								catch (RegexError err) {
									warning (err.message);
								}
							}
							if(!identificado) {
								// Detecta si la linea es ERROR
								foreach(string Expresion in expregERROR) {
									try {
										Regex RegExp = new Regex(Expresion);
										MatchInfo match;
										if(RegExp.match(linea, RegexMatchFlags.ANCHORED, out match)) {
											Respuesta = ResponseCode.ERROR;
											RespuestaEnBruto.append(linea);
											identificado = true;
											break;
										}
									}
									catch (RegexError err) {
										warning (err.message);
									}
								}
							}
							if(!identificado) {
								// Detecta si la linea es ERROR_CMS
								// TODO 
								// Implementar deteccion de descripcion de este error y anexarlo a la respuesta
								foreach(string Expresion in expregERROR_CMS) {
									try {
										Regex RegExp = new Regex(Expresion);
										MatchInfo match;
										if(RegExp.match(linea, RegexMatchFlags.ANCHORED, out match)) {
											Respuesta = ResponseCode.ERROR_CMS;
											RespuestaEnBruto.append(linea);
											identificado = true;
											//TODO: Lanzar un evento indicando el error
											warning("%s\n", linea);
											break;
										}
									}
									catch (RegexError err) {
										warning (err.message);
									}
								}
							}
							if(!identificado) {
								// Detecta si la linea es ERROR_CME
								// TODO 
								// Implementar deteccion de descripcion de este error y anexarlo a la respuesta
								foreach(string Expresion in expregERROR_CMEE) {
									//print("Linea %s\n", linea);
									try {
										Regex RegExp = new Regex(Expresion);
										MatchInfo match;
										if(RegExp.match(linea, RegexMatchFlags.ANCHORED, out match)) {
											Respuesta = ResponseCode.ERROR_CME;
											RespuestaEnBruto.append(linea);
											identificado = true;
											warning("%s\n", linea);
											break;
										}
									}
									catch (RegexError err) {
										warning (err.message);
									}
								}
							}
							if(!identificado) {
								foreach(string Expresion in expregCLIP) {
									try {
										Regex RegExp = new Regex(Expresion);
										MatchInfo match;
										if(RegExp.match(linea, RegexMatchFlags.ANCHORED, out match)) {
											string NumberPhone = match.fetch_named("CLIP");
											this.LastCall.Number = NumberPhone;
											this.LastCall.Date = new DateTime.now_local();
											this.LastCall.Read = false;
											CallID(NumberPhone);
											identificado = true;
											break;
										}
									}
									catch (RegexError err) {
										warning (err.message);
									}
								}
							}
							if(!identificado) {
								ModemReadLines.add(Strip(linea));
								RespuestaEnBruto.append(linea);
							}
							// TODO: Verificar si esto es necesario
							if(Respuesta != ResponseCode.UNKNOW) {
								// Se hace un doble chequeo para verificar que no hay mas bits por leer, esto previene que se detecte falsamente
								// un ERROR u OK cuando en Modo texto se lee un sms que contenga esas parabras.
								if(preventDetectFalseResponse) {
									//print("Doble chequeo %s\n", preventDetectFalseResponse.to_string());
									if(this.BytesToReadInternal()) {
										ModemReadLines.add(Strip(linea));
										RespuestaEnBruto.append(linea);
										Respuesta = ResponseCode.UNKNOW;
									}
								}
							}
						}
					}
				}
				Temporizador.stop();
				Response Respuest =  new Response.with_args(Respuesta,  ModemReadLines, RespuestaEnBruto.str);
				return Respuest;
			}
		
			/**
			* Send an AT command to modem
			*/
			public bool Send(string ComandoAT) {
				bool Retorno = false;
				this.DiscardBuffer();
				long Escrito = Write(ComandoAT);
				if(Escrito>0) {
					Retorno = true;
				} else {
					stderr.printf("Could not write to the port %s\n", this.Port);
				}
				return Retorno;
			}


			/**
			* Send an AT command to modem and expected response OK or ERROR
			* @param waitforresponse_ms Time in milliseconds that a response is expected modem. <<BR>>
			* You can increase this value if the modem delay in responding.
			*/
			public bool SendSimpleCommand(string ATCommand, double waitforresponse_ms = 0) {
				bool Retorno= false;
				this.DiscardBuffer();
				long Escrito = this.Write(ATCommand);
				if(Escrito>0) {
					if(Receive(waitforresponse_ms).Return == ResponseCode.OK) {
						Retorno = true;
					}
				} else {
					stderr.printf("Could not write to the port %s\n", this.Port);
					if(LogModem) {
						LogCommandAT(ATCommand+": Could not write to the port\n");
					}
				}
				return 	Retorno;
			}
			
			/**
			* Alias ATD
			* @see ATD
			*/
			[Description(nick = "Dial Command", blurb = "It dials in phone number passed as parameter")]
			public bool DialCommand(string number) {
				return this.ATD(number);
			}

			/**
			* It dials in phone number passed as parameter
			* Only DTMF allowed
			*/			
			[Description(nick = "ATD", blurb = "It dials in phone number passed as parameter")]
			public bool ATD(string  Number) {
				bool Retorno = false;
				// TODO
				// Hacer una verificacion para que unicamente DTMF sean permitidos
				StringBuilder ComandoAT = new StringBuilder("ATD");
				ComandoAT.append(Number);
				ComandoAT.append("\r");
				if(this.IsOpen) {
					this.DiscardBuffer();
					this.Write(ComandoAT.str);
					Retorno = true;
				}
				return Retorno;
			}
			
			/**
			* Alias ATZ
			* @see ATZ
			*/
			[Description(nick = "Set To Default Configuration", blurb = "Alias ATZ")]
			public bool SetToDefaultConfiguration() {
				return this.ATZ();
			}
			
			/**
			* Reset modem
			* The modem back to their initial values
			*/
			[Description(nick = "ATZ", blurb = "The modem back to their initial values")]
				public bool ATZ() {
				return this.SendSimpleCommand("ATZ\r");
			}
			
			/**
			* Enable / Disable terminal echo
			*/
			public bool ATE(bool enable) {
				string comando = "ATE0\r";
				if(enable) {
					comando = "ATE1\r";
				}
				return this.SendSimpleCommand(comando);
			}
			
			/**
			* Modem to verbose mode
			*/
			// TODO
			// Probar que funcione
			public bool ATV(bool enable) {
				string comando = "ATV0\r";
				if(enable) {
					comando = "ATV1\r";
				}
				return this.SendSimpleCommand(comando);
			}
			
			/**
			* @see ATV
			*/			
			public bool VerboseMode(bool enable) {
				return ATV(enable);
			}
			/**
			* @see ATE
			*/			
			public bool Echo(bool enable) {
				return ATE(enable);
			}
			/**
			* Enter the //value// in //register//
			*/			
			public bool ATS_Set(int register, int value) {
				return this.SendSimpleCommand("ATS"+register.to_string()+"="+value.to_string()+"\r");
			}
			/**
			* Sets the number of rings before answering an incoming call so automatically.
			*/
			public bool AutomaticAnswerControl_Set(int rings) {
				return ATS_Set(0, rings);
			}
			/**
			* @see ATS0
			*/
			public int AutomaticAnswerControl() {
				return ATS(0);
			}
			/**
			* Get automatic answer control
			*/			
			public int ATS0() {
				return AutomaticAnswerControl();
			}
			/**
			* Set automatic answer control
			*/						
			public bool ATS0_Set(int rings) {
				return AutomaticAnswerControl_Set(rings);
			}
			/**
			* @see ATS2_Set
			*/						
			public bool EscapeSequenseCharacter_Set(int character = 43) {
				return ATS_Set(2, character);
			}
			/**
			* @see ATS2
			*/				
			public int EscapeSequenseCharacter() {
				return ATS(2);
			}
			/**
			* Get escape sequense character
			*/								
			public int ATS2() {
				return EscapeSequenseCharacter();
			}
			/**
			* Set escape sequense character
			*/			
			public bool ATS2_Set(int character = 43) {
				return EscapeSequenseCharacter_Set(character);
			}
			/**
			* @see ATS3_Set
			*/
			public bool CommandLineTerminationCharacter_Set(int character = 13) {
				return ATS_Set(3, character);
			}
			/**
			* @see ATS3
			*/
			public int CommandLineTerminationCharacter() {
				return ATS(3);
			}
			/**
			* Get Command line termination character
			*/
			public int ATS3() {
				return CommandLineTerminationCharacter();
			}
			/**
			* Set Command line termination character
			*/			
			public bool ATS3_Set(int character = 13) {
				return CommandLineTerminationCharacter_Set(character);
			}
			/**
			* @see ATS4_Set
			*/
			public bool ResponseFormattingCharacter_Set(int character = 10) {
				return ATS_Set(4, character);
			}
			/**
			* @see ATS4
			*/
			public int ResponseFormattingCharacter() {
				return ATS(4);
			}
			/**
			* Get Response formatting character
			*/
			public int ATS4() {
				return ResponseFormattingCharacter();
			}
			/**
			* Set Response formatting character
			*/
			public bool ATS4_Set(int character = 10) {
				return ResponseFormattingCharacter_Set(character);
			}
			/**
			* @see ATS5_Set
			*/
			public bool CommandLineEditingCharacter_Set(int character = 8) {
				return ATS_Set(5, character);
			}
			/**
			* @see ATS5
			*/
			public int CommandLineEditingCharacter() {
				return ATS(5);
			}
			/**
			* Get Command line editing character
			*/
			public int ATS5() {
				return CommandLineEditingCharacter();
			}
			/**
			* Set Command line editing character
			*/
			public bool ATS5_Set(int character = 8) {
				return CommandLineEditingCharacter_Set(character);
			}
			/**
			* Set Completion connection timeout
			*/
			public bool ATS7_Set(int timeout = 50) {
				return ATS_Set(7, timeout);
			}
			/**
			* @see ATS7_Set
			*/
			public bool CompletionConnectionTimeOut_Set(int timeout = 50) {
				return ATS7_Set(timeout);
			}
			/**
			* Get Completion connection timeout
			*/
			public int ATS7() {
				return ATS(7);
			}
			/**
			* @see ATS7
			*/
			public int CompletionConnectionTimeOut() {
				return ATS7();
			}
			/**
			* Set Automatic disconnect delay control
			*/
			public bool ATS10_Set(int delay = 2) {
				return ATS_Set(10, delay);
			}
			/**
			* @see ATS10
			*/
			public bool AutomaticDisconnectDelayControl_Set(int delay = 2) {
				return ATS10_Set(delay);
			}
			/**
			* Get Automatic disconnect delay control
			*/
			public int ATS10() {
				return ATS(10);
			}
			/**
			* @see ATS10
			*/
			public int AutomaticDisconnectDelayControl() {
				return ATS10();
			}
			// TODO
			// Probar qe funcione
			/**
			* Get value to register
			*/
			public int ATS(int register) {
				int Retorno = 0;
				this.DiscardBuffer();
				this.Send("ATS"+register.to_string()+"?\r");
				Response Respuesta = this.Receive();
				if(Respuesta.Return == ResponseCode.OK) {
					try {
						Regex RegExp = new Regex("(?<Value>[0-9]+)");
						foreach(string Linea in Respuesta.Lines) {
							MatchInfo match;
							if(RegExp.match(Linea, RegexMatchFlags.ANCHORED, out match)) {
								Retorno = int.parse(match.fetch_named("Value"));
								break;
							}
						}
					}
					catch (RegexError err) {
						warning (err.message);
					}
				}
				return Retorno;
			}
			/**
			* Lets verify that communication with the device
			*/
			public bool AT() {
				return this.SendSimpleCommand("AT\r");
			}
			/**
			* Escape sequence of the PPP session (+++). <<BR>>
			* There must be half a second without characters before and half a second with no characters after entering the sequence
			*/
			public bool EscapeSequense() {
				return this.SendSimpleCommand("+++\r");
			}
			/**
			* @see ATA
			*/
			[Description(nick = "Accept Call", blurb = "Answer an incoming call")]
			public bool AcceptCall() {
				return this.ATA();
			}
			/**
			* Answer an incoming call
			*/
			[Description(nick = "ATA", blurb = "Answer an incoming call")]
				public bool ATA() {
				return this.SendSimpleCommand("ATA\r");
			}
		}
	}
}
