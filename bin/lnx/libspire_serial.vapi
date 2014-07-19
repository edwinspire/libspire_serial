/* libspire_serial.vapi generated by valac 0.16.1, do not modify. */

namespace edwinspire {
	namespace Ports {
		[CCode (cheader_filename = "libspire_serial.h")]
		public class Configure : GLib.Object {
			public Configure ();
			public uint BaudRate { get; set; }
			public ulong BufferIn { get; set; }
			public ulong BufferOut { get; set; }
			public uint DataBits { get; set; }
			public bool Enable { get; set; }
			public edwinspire.Ports.HandShaking HandShake { get; set; }
			public edwinspire.Ports.Parity Parityp { get; set; }
			public string Port { get; set; }
			public edwinspire.Ports.StopBits StopBitsp { get; set; }
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		[Description (blurb = "Clase para manejar Modems", nick = "Modem")]
		public class Modem : edwinspire.Ports.SerialPort {
			public edwinspire.Ports.LastCallReceived LastCall;
			public Modem ();
			public bool AT ();
			[Description (blurb = "Acepta una llamada entrante", nick = "ATA")]
			public bool ATA ();
			[Description (blurb = "Marca en numero pasado como parametro", nick = "ATD")]
			public bool ATD (string Number);
			public bool ATE (bool enable);
			public int ATS (int register);
			public int ATS0 ();
			public bool ATS0_Set (int rings);
			public int ATS10 ();
			public bool ATS10_Set (int delay = 2);
			public int ATS2 ();
			public bool ATS2_Set (int character = 43);
			public int ATS3 ();
			public bool ATS3_Set (int character = 13);
			public int ATS4 ();
			public bool ATS4_Set (int character = 10);
			public int ATS5 ();
			public bool ATS5_Set (int character = 8);
			public int ATS7 ();
			public bool ATS7_Set (int timeout = 50);
			public bool ATS_Set (int register, int value);
			public bool ATV (bool enable);
			[Description (blurb = "Reset modem. Vuelve el modem a sus valores iniciales", nick = "ATZ")]
			public bool ATZ ();
			[Description (blurb = "Acepta una llamada entrante", nick = "Accept Call")]
			public bool AcceptCall ();
			[Description (blurb = "Intenta detectar el Baudrate mas adecuado para el modem", nick = "AutoBaudRate")]
			public uint AutoBaudRate ();
			public int AutomaticAnswerControl ();
			public bool AutomaticAnswerControl_Set (int rings);
			public int AutomaticDisconnectDelayControl ();
			public bool AutomaticDisconnectDelayControl_Set (int delay = 2);
			public int CommandLineEditingCharacter ();
			public bool CommandLineEditingCharacter_Set (int character = 8);
			public int CommandLineTerminationCharacter ();
			public bool CommandLineTerminationCharacter_Set (int character = 13);
			public int CompletionConnectionTimeOut ();
			public bool CompletionConnectionTimeOut_Set (int timeout = 50);
			[Description (blurb = "Marca en numero pasado como parametro", nick = "Dial Command")]
			public bool DialCommand (string number);
			public bool Echo (bool enable);
			public bool EscapeSequense ();
			public int EscapeSequenseCharacter ();
			public bool EscapeSequenseCharacter_Set (int character = 43);
			[Description (blurb = "Respuesta del modem", nick = "Receive")]
			public edwinspire.Ports.Response Receive (double waitforresponse_ms = 0, bool preventDetectFalseResponse = false);
			public int ResponseFormattingCharacter ();
			public bool ResponseFormattingCharacter_Set (int character = 10);
			public bool Send (string ComandoAT);
			public bool SendSimpleCommand (string ATCommand, double waitforresponse_ms = 0);
			[Description (blurb = "Vuelve el modem a sus valores iniciales", nick = "Set To Default Configuration")]
			public bool SetToDefaultConfiguration ();
			public bool VerboseMode (bool enable);
			[Description (blurb = "Señal emitida cuando se detecta el CallId de una llamada entrante", nick = "CallID")]
			public signal void CallID (string Number);
			[Description (blurb = "Señal emitida cuando el modem esta timbrando", nick = "Ringing")]
			public signal void Ringing ();
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		public class Response : GLib.Object {
			public edwinspire.Ports.CME CMEError;
			public edwinspire.Ports.CMS CMSError;
			public Gee.ArrayList<string> Lines;
			public string Raw;
			public edwinspire.Ports.ResponseCode Return;
			public Response ();
			public string ToString ();
			public Response.with_args (edwinspire.Ports.ResponseCode Return, Gee.ArrayList<string> Lines, string raw, edwinspire.Ports.CME cmeError = CME.None, edwinspire.Ports.CMS cmsError = CMS.None);
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		public class SerialPort : edwinspire.Ports.Configure {
			public bool LogModem;
			public SerialPort ();
			public double BaudRateTomseg ();
			public double BaudRateTouseg ();
			public bool Close ();
			public bool DiscardBuffer ();
			public string[] Get_PortName ();
			public static void LogCommandAT (string text = "");
			public bool Open ();
			public char ReadChar ();
			public string? ReadLine (double timeout_ms_for_line = 0);
			public string? ReadLineWithoutStrip (double timeout_ms_for_line = 0);
			public static string Strip (string String);
			public bool Time (uint Time_);
			public long Write (string Data_);
			public SerialPort.with_args (string Port_ = "/dev/ttyS0", uint Baudrate = 2400, uint DataBits = 8, edwinspire.Ports.Parity Parity_ = Parity.NONE, edwinspire.Ports.StopBits StopBits_ = StopBits.ONE, edwinspire.Ports.HandShaking HS_ = HandShaking.NONE);
			public bool Blocking { get; set; }
			public int BytesToRead { get; }
			public bool IsOpen { get; }
			public signal void Status (edwinspire.Ports.DataStatus Status);
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		public struct LastCallReceived {
			public string Number;
			public GLib.DateTime Date;
			public bool Read;
			public LastCallReceived ();
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		[Description (blurb = "GSM Equipment and Network Error Codes", nick = "CME")]
		public enum CME {
			PhoneFailure,
			NoConnectionToPhone,
			PhoneAdaptorLinkReserved,
			OperationNotAllowed,
			OperationNotSupported,
			PH_SIM_PIN_Required,
			PH_FSIM_PIN_Rrequired,
			PH_FSIM_PUK_Required,
			SIM_NotInserted,
			SIM_PIN_Required,
			SIM_PUK_Required,
			SIM_Failure,
			SIM_Busy,
			SIM_Wrong,
			IncorrectPassword,
			SIM_PIN2_Required,
			SIM_PUK2_Rrequired,
			MemoryFull,
			InvalidIndex,
			NotFound,
			MemoryFailure,
			TextStringTooLong,
			InvalidCharactersInTextString,
			DialStringTooLong,
			InvalidCharactersInDialString,
			NoNetworkService,
			NetworkTimeout,
			EmergencyCallsOnly,
			NetworkPersonalizationPIN_Required,
			NetworkPersonalization_PUK_Required,
			NetworkSubsetPersonalization_PIN_Required,
			NetworkSubsetPersonalization_PUK_Required,
			ServiceProviderPersonalization_PIN_Required,
			ServiceProviderPersonalization_PUK_Required,
			CorporatePersonalization_PIN_Required,
			CorporatePersonalization_PUK_Required,
			PHSIM_PUK_Required,
			Unknown,
			Illegal_MS,
			Illegal_ME,
			GPRS_Services_Not_Allowed,
			PLMN_Not_Allowed,
			Location_Area_Not_Allowed,
			Roaming_Not_Allowed_In_This_Location_Area,
			Operation_Temporary_Not_Allowed,
			Service_Operation_Not_Supported,
			Requested_Service_Option_Not_Subscribed,
			Service_Option_Temporary_Out_Of_Order,
			Unspecified_GPRS_Error,
			PDP_Authentication_Failure,
			Invalid_Mobile_Class,
			Operation_Temporarily_Not_Allowed,
			Call_Barred,
			Phone_Is_Busy,
			User_Abort,
			Invalid_Dial_String,
			SS_Not_Executed,
			SIM_Blocked,
			Invalid_Block,
			None
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		[Description (blurb = "These are the error codes for +CMS ERROR", nick = "CMS")]
		public enum CMS {
			None,
			UnassignedNumber,
			OperatorDeterminedBarring,
			CallBared,
			ShortMessageTransferRejected,
			DestinationOutOfService,
			UnindentifiedSubscriber,
			FacilityRejected,
			UnknownSubscriber,
			NetworkOutOfOrder,
			TemporaryFailure,
			Congestion,
			RecourcesUnavailable,
			RequestedFacilityNotSubscribed,
			RequestedFacilityNotImplemented,
			InvalidShortMessageTransferReferenceValue,
			InvalidMessageUnspecified,
			InvalidMandatoryInformation,
			MessageTypeNonExistentOrNotImplemented,
			MessageNotCompatibleWithShortMessageProtocol,
			InformationElementNonExistentOrNotImplemente,
			ProtocolErrorUnspecified,
			InternetworkingUnspecified,
			TelematicInternetworkingNotSupported,
			ShortMessageType0NotSupported,
			CannotReplaceShortMessage,
			UnspecifiedTPPIDError,
			DataCodeSchemeNotSupported,
			MessageClassNotSupported,
			UnspecifiedTPDCSError,
			CommandCannotBeActioned,
			CommandUnsupported,
			UnspecifiedTPCommandError,
			TPDUNotSupported,
			SCBusy,
			NoSCSubscription,
			SCSystemFailure,
			InvalidSMEAddress,
			DestinationSMEBarred,
			SMRejectedDuplicateSM,
			TPVPFNotSupported,
			TPVPNotSupported,
			D0_SIM_SMS_StorageFull,
			NoSMS_StorageCapabilityInSIM,
			ErrorInMS,
			MemoryCapacityExceeded,
			SimApplicationToolkitBusy,
			SIM_DataDownloadError,
			UnspecifiedErrorCause,
			ME_Failure,
			SMS_ServiceOf_ME_Reserved,
			OperationNotAllowed,
			OperationNotSupported,
			Invalid_PDU_ModeParameter,
			Invalid_Text_ModeParameter,
			SIMNotInserted,
			SIM_PIN_Required,
			PH_SIM_PIN_Required,
			SIM_Failure,
			SIM_Busy,
			SIM_Wrong,
			SIM_PUK_Required,
			SIM_PIN2_Required,
			SIM_PUK2_Required,
			MemoryFailure,
			InvalidMemoryIndex,
			MemoryFull,
			SMSC_AddressUnknown,
			NoNetworkService,
			NetworkTimeout,
			No_CNMA_Expected,
			UnknownError,
			UserAbort,
			UnableToStore,
			InvalidStatus,
			DeviceBusyOrInvalidCharacterInString,
			InvalidLength,
			InvalidCharacterInPDU,
			InvalidParameter,
			InvalidLengthOrCharacter,
			InvalidCharacterInText,
			TimerExpired,
			OperationTemporaryNotAllowed,
			SIM_NotReady,
			CellBroadcastErrorUnknown,
			ProtocolStackBusy
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		[Description (blurb = "DTMF tones", nick = "DTMF")]
		public enum DTMF {
			[Description (blurb = "DTMF 0", nick = "0")]
			Zero,
			[Description (blurb = "DTMF 1", nick = "1")]
			One,
			[Description (blurb = "DTMF 2", nick = "2")]
			Two,
			[Description (blurb = "DTMF 3", nick = "3")]
			Three,
			[Description (blurb = "DTMF 4", nick = "4")]
			Four,
			[Description (blurb = "DTMF 5", nick = "5")]
			Five,
			[Description (blurb = "DTMF 6", nick = "6")]
			Six,
			[Description (blurb = "DTMF 7", nick = "7")]
			Seven,
			[Description (blurb = "DTMF 8", nick = "8")]
			Eigth,
			[Description (blurb = "DTMF 9", nick = "9")]
			Nine,
			[Description (blurb = "DTMF *", nick = "*")]
			Asterisc,
			[Description (blurb = "DTMF #", nick = "#")]
			Sharp,
			[Description (blurb = "DTMF A", nick = "A")]
			A,
			[Description (blurb = "DTMF B", nick = "B")]
			B,
			[Description (blurb = "DTMF C", nick = "C")]
			C,
			[Description (blurb = "DTMF D", nick = "D")]
			D
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		[Description (blurb = "Specifies the state of the data modem", nick = "Data Status")]
		public enum DataStatus {
			[Description (blurb = "Modem not performing some action", nick = "None")]
			None,
			[Description (blurb = "Sending data to the modem", nick = "Sending")]
			Sending,
			[Description (blurb = "Receiving data from the modem", nick = "Receiving")]
			Receiving
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		[Description (blurb = "Specifies the control protocol used to establish communication with the serial port", nick = "HandShaking")]
		public enum HandShaking {
			[Description (blurb = "No control is not used for the protocol binding", nick = "NONE")]
			NONE,
			[Description (blurb = "Controls hardware, Ready to Send (RTS) and Clear to Send (CTS)", nick = "RTS-CTS")]
			RTS_CTS,
			[Description (blurb = "Protocol software control XON / XOFF", nick = "XOnXOff")]
			XOnXOff,
			[Description (blurb = "Use both RTS-CTS and XON / XOFF", nick = "DTR-DSR")]
			DTR_DSR
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		[Description (blurb = "Specifies the parity bit for the serial communication", nick = "Parity")]
		public enum Parity {
			[Description (blurb = "Without testing calculation parity bit", nick = "NONE")]
			NONE,
			[Description (blurb = "Sets the parity bit so that the count of bits set is an odd number", nick = "ODD")]
			ODD,
			[Description (blurb = "Sets the parity bit so that the count of bits set is an even number", nick = "EVEN")]
			EVEN,
			[Description (blurb = "Sets the parity bit set to 1", nick = "MARK")]
			MARK,
			[Description (blurb = "Sets the parity bit set to 0", nick = "SPACE")]
			SPACE
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		[Description (blurb = "Response from modem", nick = "ResponseCode")]
		public enum ResponseCode {
			OK,
			CONNECT,
			RING,
			NOCARRIER,
			ERROR,
			NODIALTONE,
			BUSY,
			NOANSWER,
			[Description (blurb = "CMS (GSM Network Related) error", nick = "ERROR CMS")]
			ERROR_CMS,
			[Description (blurb = "CME (GSM Equipment Related) error", nick = "ERROR CME")]
			ERROR_CME,
			UNKNOW
		}
		[CCode (cheader_filename = "libspire_serial.h")]
		[Description (blurb = "Specifies the number of stop bits used", nick = "StopBits")]
		public enum StopBits {
			[Description (blurb = "No stop bit is used", nick = "NONE")]
			NONE,
			[Description (blurb = "One stop bit is used", nick = "ONE")]
			ONE,
			[Description (blurb = "Two stop bit is used", nick = "TWO")]
			TWO
		}
	}
}
