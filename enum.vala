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

namespace edwinspire {

	namespace Ports {
	
 /* Parity Serial communications Parity type */		
        [Description(nick = "Parity", blurb = "Especifica el bit de paridad")]
        public enum Parity {
			[Description(nick = "NONE", blurb = "No se produce una comprobación de paridad")]
			NONE,  /*!< None */
			[Description(nick = "ODD", blurb = "Establece el bit de paridad de forma que el recuento de bits establecidos sea un número impar")]
			ODD,  /*!< Odd */
			[Description(nick = "EVEN", blurb = "Establece el bit de paridad de forma que el recuento de bits establecidos sea un número par")]
			EVEN,  /*!< Even */
			[Description(nick = "MARK", blurb = "Establece el conjunto de bits de paridad en 1")]
			MARK,  /*!< Mark */
			[Description(nick = "SPACE", blurb = "Establece el conjunto de bits de paridad en 0")]
			SPACE  /*!< Space */
		}		
	
 /* CMS These are the error codes for +CMS ERROR. 0-127   GSM 04.11 Annex E-2 values 128-255   GSM 03.40 section 9.2.3.22 values */
 		[Description(nick = "CMS", blurb = "These are the error codes for +CMS ERROR")]
		public enum CMS {
			Phonefailure  = 300,
			SMSServiceOfPhoneReserved = 301,
			OperationNotAllowed = 302,
			OperationNotSupported = 303,
			InvalidPDUModeParameter = 304,
			InvalidTextModeParameter = 305,
			SIMNotInserted = 310,
			SIMPINNecessary = 311, 
			PH_SIMPINNecessary = 312, 
			SIMFailure = 313,
			SIMBusy =  314,
			SIMWrong = 315,
			MemoryFailure = 320,
			InvalidMemoryIndex = 321, 
			MemoryFull = 322,
			SMSCAddressUnknown = 330,
			NoNetworkService = 331, 
			NetworkTimeout = 332,
			UnknownError = 500, 
			ManufacturerSpecific = 512, 
			None = 1000
		}
	
	
	
/* Create a HandShaking */	
		[Description(nick = "HandShaking", blurb = "Especifica el protocolo de control utilizado para establecer la comunicacion con el puerto serie")]
		public enum HandShaking{
			[Description(nick = "NONE", blurb = "No se utiliza ningun control para el protocol de enlace")]
			NONE, /*!< None */
			[Description(nick = "RTS-CTS", blurb = "Controles por hardware, Solicitud de encio (RTS) y Listo para enviar (CTS)")]
			RTS_CTS, /*!< RTS-CTS */
			[Description(nick = "XOnXOff", blurb = "Protocolo de control de software XON/XOFF")]
			XOnXOff, /*!< XOnXOff */
			[Description(nick = "DTR-DSR", blurb = "Utiliza tanto RTS CTS como XON/XOFF")]
			DTR_DSR  /*!< DTR-DSR */
		}
		
		
 /* StopBits Serial communications StopBits type */			
		[Description(nick = "StopBits", blurb = "Especifica el número de bits de parada utilizado")]
		public enum StopBits {
			[Description(nick = "NONE", blurb = "No se utiliza ningún bit de parada")]
			NONE, 
			[Description(nick = "ONE", blurb = "Se utiliza un bit de parada")]
			ONE, 
			[Description(nick = "TWO", blurb = "Se utilizan dos bits de parada")]
			TWO
		}
		
 /* DataStatus */				
		[Description(nick = "Data Status", blurb = "Estado del modem")]
		public enum DataStatus {
			[Description(nick = "None", blurb = "Modem no eta realizando ninguna accion")]
			None,  /*!< None */
			[Description(nick = "Sending", blurb = "Enviando datos al modem")]
			Sending, 
			[Description(nick = "Receiving", blurb = "Recibiendo datos del modem")]
			Receiving
		}
		
		
	 /* DTMF valid values */	
		[Description(nick = "DTMF", blurb = "Tono DTMF permitidos")]
			public enum DTMF {
			[Description(nick = "0", blurb = "DTMF 0")]
					Zero, /*!< 0 */
			[Description(nick = "1", blurb = "DTMF 1")]
					One, /*!< 1 */
			[Description(nick = "2", blurb = "DTMF 2")]
					Two, /*!< 2 */
			[Description(nick = "3", blurb = "DTMF 3")]
					Three, /*!< 3 */
			[Description(nick = "4", blurb = "DTMF 4")]
					Four, /*!< 4 */
			[Description(nick = "5", blurb = "DTMF 5")]
					Five, /*!< 5 */
			[Description(nick = "6", blurb = "DTMF 6")]
					Six, /*!< 6 */
			[Description(nick = "7", blurb = "DTMF 7")]
					Seven, /*!< 7 */
			[Description(nick = "8", blurb = "DTMF 8")]
					Eigth, /*!< 8 */
			[Description(nick = "9", blurb = "DTMF 9")]
					Nine, /*!< 9 */
			[Description(nick = "*", blurb = "DTMF *")]
					Asterisc, /*!< * */
			[Description(nick = "#", blurb = "DTMF #")]
			Sharp, /*!< \# */
			[Description(nick = "A", blurb = "DTMF A")]
			A, /*!< A */
			[Description(nick = "B", blurb = "DTMF B")]
			B, /*!< B */
			[Description(nick = "C", blurb = "DTMF C")]
			C, /*!< C */
			[Description(nick = "D", blurb = "DTMF D")]
			D /*!< D */
		}
		
/* Response from modem */	
		[Description(nick = "ResponseCode", blurb = "Response from modem")]
		public enum ResponseCode {
			OK = 0, /*!< Modem response OK */
			CONNECT = 1, /*!< Connect */
			RING = 2, /*!< Ring */
			NOCARRIER = 3, /*!< No carrier */
			ERROR = 4, /*!< Error */
			NODIALTONE = 5, /*!< No dial tone */
			BUSY = 6, /*!< Busy */
			NOANSWER = 7, /*!< No answer */
			[Description(nick = "ERROR CMS", blurb = "Responde con ERROR modem GSM")]
			ERROR_CMS = 98, /*!< Modems GSM response with Error */
			[Description(nick = "ERROR CME", blurb = "Responde con ERROR CME")]
			ERROR_CME = 99, /*!< CME response with error */
			UNKNOW = 100
		}
		
/* GSM Equipment and Network Error Codes */		
		[Description(nick = "CME", blurb = "GSM Equipment and Network Error Codes")]
		public enum CME {
			PhoneFailure = 0, /*!< Phone failure */
			NoConnectionToPhone = 1, /*!< No connection to phone */
			PhoneAdaptorLinkReserved = 2, /*!< Phone adaptor link reserved */
			OperationNotAllowed = 3,
			OperationNotSupported = 4,
			PH_SIM_PIN_Required = 5,
			PH_FSIM_PIN_Rrequired = 6,
			PH_FSIM_PUK_Required = 7,
			SIM_NotInserted = 10,
			SIM_PIN_Required = 11,
			SIM_PUK_Required = 12,
			SIM_Failure = 13,
			SIM_Busy = 14,
			SIM_Wrong = 15,
			IncorrectPassword = 16,
			SIM_PIN2_Required = 17,
			SIM_PUK2_Rrequired = 18,
			MemoryFull = 20,
			InvalidIndex = 21,
			NotFound = 22,
			MemoryFailure = 23,
			TextStringTooLong = 24,
			InvalidCharactersInTextString = 25,
			DialStringTooLong = 26,
			InvalidCharactersInDialString = 27,
			NoNetworkService = 30,
			NetworkTimeout = 31,
			EmergencyCallsOnly = 32,
			NetworkPersonalizationPIN_Required = 40,
			NetworkPersonalization_PUK_Required = 41,
			NetworkSubsetPersonalization_PIN_Required = 42, 
			NetworkSubsetPersonalization_PUK_Required = 43,
			ServiceProviderPersonalization_PIN_Required = 44,
			ServiceProviderPersonalization_PUK_Required = 45,
			CorporatePersonalization_PIN_Required = 46,
			CorporatePersonalization_PUK_Required = 47,
			Unknown = 100,
			None = 1000
		}



		
		
		
		
		
		
		}
		}
