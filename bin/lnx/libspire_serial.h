/* libspire_serial.h generated by valac 0.16.1, the Vala compiler, do not modify */


#ifndef ___HOME_EDWINSPIRE_DOCUMENTOS_DESARROLLOSOFTWARE_PROYECTOSSOFTWARE_NG_PROYECTS_LIBSPIRE_SERIAL_BIN_LNX_LIBSPIRE_SERIAL_H__
#define ___HOME_EDWINSPIRE_DOCUMENTOS_DESARROLLOSOFTWARE_PROYECTOSSOFTWARE_NG_PROYECTS_LIBSPIRE_SERIAL_BIN_LNX_LIBSPIRE_SERIAL_H__

#include <glib.h>
#include <glib-object.h>
#include <stdlib.h>
#include <string.h>
#include <gee.h>
#include <float.h>
#include <math.h>

G_BEGIN_DECLS


#define EDWINSPIRE_PORTS_TYPE_PARITY (edwinspire_ports_parity_get_type ())

#define EDWINSPIRE_PORTS_TYPE_HAND_SHAKING (edwinspire_ports_hand_shaking_get_type ())

#define EDWINSPIRE_PORTS_TYPE_STOP_BITS (edwinspire_ports_stop_bits_get_type ())

#define EDWINSPIRE_PORTS_TYPE_DATA_STATUS (edwinspire_ports_data_status_get_type ())

#define EDWINSPIRE_PORTS_TYPE_DTMF (edwinspire_ports_dtmf_get_type ())

#define EDWINSPIRE_PORTS_TYPE_RESPONSE_CODE (edwinspire_ports_response_code_get_type ())

#define EDWINSPIRE_PORTS_TYPE_CMS (edwinspire_ports_cms_get_type ())

#define EDWINSPIRE_PORTS_TYPE_CME (edwinspire_ports_cme_get_type ())

#define EDWINSPIRE_PORTS_TYPE_RESPONSE (edwinspire_ports_response_get_type ())
#define EDWINSPIRE_PORTS_RESPONSE(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), EDWINSPIRE_PORTS_TYPE_RESPONSE, edwinspirePortsResponse))
#define EDWINSPIRE_PORTS_RESPONSE_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), EDWINSPIRE_PORTS_TYPE_RESPONSE, edwinspirePortsResponseClass))
#define EDWINSPIRE_PORTS_IS_RESPONSE(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), EDWINSPIRE_PORTS_TYPE_RESPONSE))
#define EDWINSPIRE_PORTS_IS_RESPONSE_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), EDWINSPIRE_PORTS_TYPE_RESPONSE))
#define EDWINSPIRE_PORTS_RESPONSE_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), EDWINSPIRE_PORTS_TYPE_RESPONSE, edwinspirePortsResponseClass))

typedef struct _edwinspirePortsResponse edwinspirePortsResponse;
typedef struct _edwinspirePortsResponseClass edwinspirePortsResponseClass;
typedef struct _edwinspirePortsResponsePrivate edwinspirePortsResponsePrivate;

#define EDWINSPIRE_PORTS_TYPE_LAST_CALL_RECEIVED (edwinspire_ports_last_call_received_get_type ())
typedef struct _edwinspirePortsLastCallReceived edwinspirePortsLastCallReceived;

#define EDWINSPIRE_PORTS_TYPE_CONFIGURE (edwinspire_ports_configure_get_type ())
#define EDWINSPIRE_PORTS_CONFIGURE(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), EDWINSPIRE_PORTS_TYPE_CONFIGURE, edwinspirePortsConfigure))
#define EDWINSPIRE_PORTS_CONFIGURE_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), EDWINSPIRE_PORTS_TYPE_CONFIGURE, edwinspirePortsConfigureClass))
#define EDWINSPIRE_PORTS_IS_CONFIGURE(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), EDWINSPIRE_PORTS_TYPE_CONFIGURE))
#define EDWINSPIRE_PORTS_IS_CONFIGURE_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), EDWINSPIRE_PORTS_TYPE_CONFIGURE))
#define EDWINSPIRE_PORTS_CONFIGURE_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), EDWINSPIRE_PORTS_TYPE_CONFIGURE, edwinspirePortsConfigureClass))

typedef struct _edwinspirePortsConfigure edwinspirePortsConfigure;
typedef struct _edwinspirePortsConfigureClass edwinspirePortsConfigureClass;
typedef struct _edwinspirePortsConfigurePrivate edwinspirePortsConfigurePrivate;

#define EDWINSPIRE_PORTS_TYPE_SERIAL_PORT (edwinspire_ports_serial_port_get_type ())
#define EDWINSPIRE_PORTS_SERIAL_PORT(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), EDWINSPIRE_PORTS_TYPE_SERIAL_PORT, edwinspirePortsSerialPort))
#define EDWINSPIRE_PORTS_SERIAL_PORT_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), EDWINSPIRE_PORTS_TYPE_SERIAL_PORT, edwinspirePortsSerialPortClass))
#define EDWINSPIRE_PORTS_IS_SERIAL_PORT(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), EDWINSPIRE_PORTS_TYPE_SERIAL_PORT))
#define EDWINSPIRE_PORTS_IS_SERIAL_PORT_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), EDWINSPIRE_PORTS_TYPE_SERIAL_PORT))
#define EDWINSPIRE_PORTS_SERIAL_PORT_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), EDWINSPIRE_PORTS_TYPE_SERIAL_PORT, edwinspirePortsSerialPortClass))

typedef struct _edwinspirePortsSerialPort edwinspirePortsSerialPort;
typedef struct _edwinspirePortsSerialPortClass edwinspirePortsSerialPortClass;
typedef struct _edwinspirePortsSerialPortPrivate edwinspirePortsSerialPortPrivate;

#define EDWINSPIRE_PORTS_TYPE_MODEM (edwinspire_ports_modem_get_type ())
#define EDWINSPIRE_PORTS_MODEM(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), EDWINSPIRE_PORTS_TYPE_MODEM, edwinspirePortsModem))
#define EDWINSPIRE_PORTS_MODEM_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), EDWINSPIRE_PORTS_TYPE_MODEM, edwinspirePortsModemClass))
#define EDWINSPIRE_PORTS_IS_MODEM(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), EDWINSPIRE_PORTS_TYPE_MODEM))
#define EDWINSPIRE_PORTS_IS_MODEM_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), EDWINSPIRE_PORTS_TYPE_MODEM))
#define EDWINSPIRE_PORTS_MODEM_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), EDWINSPIRE_PORTS_TYPE_MODEM, edwinspirePortsModemClass))

typedef struct _edwinspirePortsModem edwinspirePortsModem;
typedef struct _edwinspirePortsModemClass edwinspirePortsModemClass;
typedef struct _edwinspirePortsModemPrivate edwinspirePortsModemPrivate;

typedef enum  {
	EDWINSPIRE_PORTS_PARITY_NONE,
	EDWINSPIRE_PORTS_PARITY_ODD,
	EDWINSPIRE_PORTS_PARITY_EVEN,
	EDWINSPIRE_PORTS_PARITY_MARK,
	EDWINSPIRE_PORTS_PARITY_SPACE
} edwinspirePortsParity;

typedef enum  {
	EDWINSPIRE_PORTS_HAND_SHAKING_NONE,
	EDWINSPIRE_PORTS_HAND_SHAKING_RTS_CTS,
	EDWINSPIRE_PORTS_HAND_SHAKING_XOnXOff,
	EDWINSPIRE_PORTS_HAND_SHAKING_DTR_DSR
} edwinspirePortsHandShaking;

typedef enum  {
	EDWINSPIRE_PORTS_STOP_BITS_NONE,
	EDWINSPIRE_PORTS_STOP_BITS_ONE,
	EDWINSPIRE_PORTS_STOP_BITS_TWO
} edwinspirePortsStopBits;

typedef enum  {
	EDWINSPIRE_PORTS_DATA_STATUS_None,
	EDWINSPIRE_PORTS_DATA_STATUS_Sending,
	EDWINSPIRE_PORTS_DATA_STATUS_Receiving
} edwinspirePortsDataStatus;

typedef enum  {
	EDWINSPIRE_PORTS_DTMF_Zero,
	EDWINSPIRE_PORTS_DTMF_One,
	EDWINSPIRE_PORTS_DTMF_Two,
	EDWINSPIRE_PORTS_DTMF_Three,
	EDWINSPIRE_PORTS_DTMF_Four,
	EDWINSPIRE_PORTS_DTMF_Five,
	EDWINSPIRE_PORTS_DTMF_Six,
	EDWINSPIRE_PORTS_DTMF_Seven,
	EDWINSPIRE_PORTS_DTMF_Eigth,
	EDWINSPIRE_PORTS_DTMF_Nine,
	EDWINSPIRE_PORTS_DTMF_Asterisc,
	EDWINSPIRE_PORTS_DTMF_Sharp,
	EDWINSPIRE_PORTS_DTMF_A,
	EDWINSPIRE_PORTS_DTMF_B,
	EDWINSPIRE_PORTS_DTMF_C,
	EDWINSPIRE_PORTS_DTMF_D
} edwinspirePortsDTMF;

typedef enum  {
	EDWINSPIRE_PORTS_RESPONSE_CODE_OK = 0,
	EDWINSPIRE_PORTS_RESPONSE_CODE_CONNECT = 1,
	EDWINSPIRE_PORTS_RESPONSE_CODE_RING = 2,
	EDWINSPIRE_PORTS_RESPONSE_CODE_NOCARRIER = 3,
	EDWINSPIRE_PORTS_RESPONSE_CODE_ERROR = 4,
	EDWINSPIRE_PORTS_RESPONSE_CODE_NODIALTONE = 5,
	EDWINSPIRE_PORTS_RESPONSE_CODE_BUSY = 6,
	EDWINSPIRE_PORTS_RESPONSE_CODE_NOANSWER = 7,
	EDWINSPIRE_PORTS_RESPONSE_CODE_ERROR_CMS = 98,
	EDWINSPIRE_PORTS_RESPONSE_CODE_ERROR_CME = 99,
	EDWINSPIRE_PORTS_RESPONSE_CODE_UNKNOW = 100
} edwinspirePortsResponseCode;

typedef enum  {
	EDWINSPIRE_PORTS_CMS_None = 0,
	EDWINSPIRE_PORTS_CMS_UnassignedNumber = 1,
	EDWINSPIRE_PORTS_CMS_OperatorDeterminedBarring = 8,
	EDWINSPIRE_PORTS_CMS_CallBared = 10,
	EDWINSPIRE_PORTS_CMS_ShortMessageTransferRejected = 21,
	EDWINSPIRE_PORTS_CMS_DestinationOutOfService = 27,
	EDWINSPIRE_PORTS_CMS_UnindentifiedSubscriber = 28,
	EDWINSPIRE_PORTS_CMS_FacilityRejected = 29,
	EDWINSPIRE_PORTS_CMS_UnknownSubscriber = 30,
	EDWINSPIRE_PORTS_CMS_NetworkOutOfOrder = 38,
	EDWINSPIRE_PORTS_CMS_TemporaryFailure = 41,
	EDWINSPIRE_PORTS_CMS_Congestion = 42,
	EDWINSPIRE_PORTS_CMS_RecourcesUnavailable = 47,
	EDWINSPIRE_PORTS_CMS_RequestedFacilityNotSubscribed = 50,
	EDWINSPIRE_PORTS_CMS_RequestedFacilityNotImplemented = 69,
	EDWINSPIRE_PORTS_CMS_InvalidShortMessageTransferReferenceValue = 81,
	EDWINSPIRE_PORTS_CMS_InvalidMessageUnspecified = 95,
	EDWINSPIRE_PORTS_CMS_InvalidMandatoryInformation = 96,
	EDWINSPIRE_PORTS_CMS_MessageTypeNonExistentOrNotImplemented = 97,
	EDWINSPIRE_PORTS_CMS_MessageNotCompatibleWithShortMessageProtocol = 98,
	EDWINSPIRE_PORTS_CMS_InformationElementNonExistentOrNotImplemente = 99,
	EDWINSPIRE_PORTS_CMS_ProtocolErrorUnspecified = 111,
	EDWINSPIRE_PORTS_CMS_InternetworkingUnspecified = 127,
	EDWINSPIRE_PORTS_CMS_TelematicInternetworkingNotSupported = 128,
	EDWINSPIRE_PORTS_CMS_ShortMessageType0NotSupported = 129,
	EDWINSPIRE_PORTS_CMS_CannotReplaceShortMessage = 130,
	EDWINSPIRE_PORTS_CMS_UnspecifiedTPPIDError = 143,
	EDWINSPIRE_PORTS_CMS_DataCodeSchemeNotSupported = 144,
	EDWINSPIRE_PORTS_CMS_MessageClassNotSupported = 145,
	EDWINSPIRE_PORTS_CMS_UnspecifiedTPDCSError = 159,
	EDWINSPIRE_PORTS_CMS_CommandCannotBeActioned = 160,
	EDWINSPIRE_PORTS_CMS_CommandUnsupported = 161,
	EDWINSPIRE_PORTS_CMS_UnspecifiedTPCommandError = 175,
	EDWINSPIRE_PORTS_CMS_TPDUNotSupported = 176,
	EDWINSPIRE_PORTS_CMS_SCBusy = 192,
	EDWINSPIRE_PORTS_CMS_NoSCSubscription = 193,
	EDWINSPIRE_PORTS_CMS_SCSystemFailure = 194,
	EDWINSPIRE_PORTS_CMS_InvalidSMEAddress = 195,
	EDWINSPIRE_PORTS_CMS_DestinationSMEBarred = 196,
	EDWINSPIRE_PORTS_CMS_SMRejectedDuplicateSM = 197,
	EDWINSPIRE_PORTS_CMS_TPVPFNotSupported = 198,
	EDWINSPIRE_PORTS_CMS_TPVPNotSupported = 199,
	EDWINSPIRE_PORTS_CMS_D0_SIM_SMS_StorageFull = 208,
	EDWINSPIRE_PORTS_CMS_NoSMS_StorageCapabilityInSIM = 209,
	EDWINSPIRE_PORTS_CMS_ErrorInMS = 210,
	EDWINSPIRE_PORTS_CMS_MemoryCapacityExceeded = 211,
	EDWINSPIRE_PORTS_CMS_SimApplicationToolkitBusy = 212,
	EDWINSPIRE_PORTS_CMS_SIM_DataDownloadError = 213,
	EDWINSPIRE_PORTS_CMS_UnspecifiedErrorCause = 255,
	EDWINSPIRE_PORTS_CMS_ME_Failure = 300,
	EDWINSPIRE_PORTS_CMS_SMS_ServiceOf_ME_Reserved = 301,
	EDWINSPIRE_PORTS_CMS_OperationNotAllowed = 302,
	EDWINSPIRE_PORTS_CMS_OperationNotSupported = 303,
	EDWINSPIRE_PORTS_CMS_Invalid_PDU_ModeParameter = 304,
	EDWINSPIRE_PORTS_CMS_Invalid_Text_ModeParameter = 305,
	EDWINSPIRE_PORTS_CMS_SIMNotInserted = 310,
	EDWINSPIRE_PORTS_CMS_SIM_PIN_Required = 311,
	EDWINSPIRE_PORTS_CMS_PH_SIM_PIN_Required = 312,
	EDWINSPIRE_PORTS_CMS_SIM_Failure = 313,
	EDWINSPIRE_PORTS_CMS_SIM_Busy = 314,
	EDWINSPIRE_PORTS_CMS_SIM_Wrong = 315,
	EDWINSPIRE_PORTS_CMS_SIM_PUK_Required = 316,
	EDWINSPIRE_PORTS_CMS_SIM_PIN2_Required = 317,
	EDWINSPIRE_PORTS_CMS_SIM_PUK2_Required = 318,
	EDWINSPIRE_PORTS_CMS_MemoryFailure = 320,
	EDWINSPIRE_PORTS_CMS_InvalidMemoryIndex = 321,
	EDWINSPIRE_PORTS_CMS_MemoryFull = 322,
	EDWINSPIRE_PORTS_CMS_SMSC_AddressUnknown = 330,
	EDWINSPIRE_PORTS_CMS_NoNetworkService = 331,
	EDWINSPIRE_PORTS_CMS_NetworkTimeout = 332,
	EDWINSPIRE_PORTS_CMS_No_CNMA_Expected = 340,
	EDWINSPIRE_PORTS_CMS_UnknownError = 500,
	EDWINSPIRE_PORTS_CMS_UserAbort = 512,
	EDWINSPIRE_PORTS_CMS_UnableToStore = 513,
	EDWINSPIRE_PORTS_CMS_InvalidStatus = 514,
	EDWINSPIRE_PORTS_CMS_DeviceBusyOrInvalidCharacterInString = 515,
	EDWINSPIRE_PORTS_CMS_InvalidLength = 516,
	EDWINSPIRE_PORTS_CMS_InvalidCharacterInPDU = 517,
	EDWINSPIRE_PORTS_CMS_InvalidParameter = 518,
	EDWINSPIRE_PORTS_CMS_InvalidLengthOrCharacter = 519,
	EDWINSPIRE_PORTS_CMS_InvalidCharacterInText = 520,
	EDWINSPIRE_PORTS_CMS_TimerExpired = 521,
	EDWINSPIRE_PORTS_CMS_OperationTemporaryNotAllowed = 522,
	EDWINSPIRE_PORTS_CMS_SIM_NotReady = 532,
	EDWINSPIRE_PORTS_CMS_CellBroadcastErrorUnknown = 534,
	EDWINSPIRE_PORTS_CMS_ProtocolStackBusy = 535
} edwinspirePortsCMS;

typedef enum  {
	EDWINSPIRE_PORTS_CME_PhoneFailure = 0,
	EDWINSPIRE_PORTS_CME_NoConnectionToPhone = 1,
	EDWINSPIRE_PORTS_CME_PhoneAdaptorLinkReserved = 2,
	EDWINSPIRE_PORTS_CME_OperationNotAllowed = 3,
	EDWINSPIRE_PORTS_CME_OperationNotSupported = 4,
	EDWINSPIRE_PORTS_CME_PH_SIM_PIN_Required = 5,
	EDWINSPIRE_PORTS_CME_PH_FSIM_PIN_Rrequired = 6,
	EDWINSPIRE_PORTS_CME_PH_FSIM_PUK_Required = 7,
	EDWINSPIRE_PORTS_CME_SIM_NotInserted = 10,
	EDWINSPIRE_PORTS_CME_SIM_PIN_Required = 11,
	EDWINSPIRE_PORTS_CME_SIM_PUK_Required = 12,
	EDWINSPIRE_PORTS_CME_SIM_Failure = 13,
	EDWINSPIRE_PORTS_CME_SIM_Busy = 14,
	EDWINSPIRE_PORTS_CME_SIM_Wrong = 15,
	EDWINSPIRE_PORTS_CME_IncorrectPassword = 16,
	EDWINSPIRE_PORTS_CME_SIM_PIN2_Required = 17,
	EDWINSPIRE_PORTS_CME_SIM_PUK2_Rrequired = 18,
	EDWINSPIRE_PORTS_CME_MemoryFull = 20,
	EDWINSPIRE_PORTS_CME_InvalidIndex = 21,
	EDWINSPIRE_PORTS_CME_NotFound = 22,
	EDWINSPIRE_PORTS_CME_MemoryFailure = 23,
	EDWINSPIRE_PORTS_CME_TextStringTooLong = 24,
	EDWINSPIRE_PORTS_CME_InvalidCharactersInTextString = 25,
	EDWINSPIRE_PORTS_CME_DialStringTooLong = 26,
	EDWINSPIRE_PORTS_CME_InvalidCharactersInDialString = 27,
	EDWINSPIRE_PORTS_CME_NoNetworkService = 30,
	EDWINSPIRE_PORTS_CME_NetworkTimeout = 31,
	EDWINSPIRE_PORTS_CME_EmergencyCallsOnly = 32,
	EDWINSPIRE_PORTS_CME_NetworkPersonalizationPIN_Required = 40,
	EDWINSPIRE_PORTS_CME_NetworkPersonalization_PUK_Required = 41,
	EDWINSPIRE_PORTS_CME_NetworkSubsetPersonalization_PIN_Required = 42,
	EDWINSPIRE_PORTS_CME_NetworkSubsetPersonalization_PUK_Required = 43,
	EDWINSPIRE_PORTS_CME_ServiceProviderPersonalization_PIN_Required = 44,
	EDWINSPIRE_PORTS_CME_ServiceProviderPersonalization_PUK_Required = 45,
	EDWINSPIRE_PORTS_CME_CorporatePersonalization_PIN_Required = 46,
	EDWINSPIRE_PORTS_CME_CorporatePersonalization_PUK_Required = 47,
	EDWINSPIRE_PORTS_CME_PHSIM_PUK_Required = 48,
	EDWINSPIRE_PORTS_CME_Unknown = 100,
	EDWINSPIRE_PORTS_CME_Illegal_MS = 103,
	EDWINSPIRE_PORTS_CME_Illegal_ME = 106,
	EDWINSPIRE_PORTS_CME_GPRS_Services_Not_Allowed = 107,
	EDWINSPIRE_PORTS_CME_PLMN_Not_Allowed = 111,
	EDWINSPIRE_PORTS_CME_Location_Area_Not_Allowed = 112,
	EDWINSPIRE_PORTS_CME_Roaming_Not_Allowed_In_This_Location_Area = 113,
	EDWINSPIRE_PORTS_CME_Operation_Temporary_Not_Allowed = 126,
	EDWINSPIRE_PORTS_CME_Service_Operation_Not_Supported = 132,
	EDWINSPIRE_PORTS_CME_Requested_Service_Option_Not_Subscribed = 133,
	EDWINSPIRE_PORTS_CME_Service_Option_Temporary_Out_Of_Order = 134,
	EDWINSPIRE_PORTS_CME_Unspecified_GPRS_Error = 148,
	EDWINSPIRE_PORTS_CME_PDP_Authentication_Failure = 149,
	EDWINSPIRE_PORTS_CME_Invalid_Mobile_Class = 150,
	EDWINSPIRE_PORTS_CME_Operation_Temporarily_Not_Allowed = 256,
	EDWINSPIRE_PORTS_CME_Call_Barred = 257,
	EDWINSPIRE_PORTS_CME_Phone_Is_Busy = 258,
	EDWINSPIRE_PORTS_CME_User_Abort = 259,
	EDWINSPIRE_PORTS_CME_Invalid_Dial_String = 260,
	EDWINSPIRE_PORTS_CME_SS_Not_Executed = 261,
	EDWINSPIRE_PORTS_CME_SIM_Blocked = 262,
	EDWINSPIRE_PORTS_CME_Invalid_Block = 263,
	EDWINSPIRE_PORTS_CME_None = 1000
} edwinspirePortsCME;

struct _edwinspirePortsResponse {
	GObject parent_instance;
	edwinspirePortsResponsePrivate * priv;
	edwinspirePortsCME CMEError;
	edwinspirePortsCMS CMSError;
	edwinspirePortsResponseCode Return;
	gchar* Raw;
	GeeArrayList* Lines;
};

struct _edwinspirePortsResponseClass {
	GObjectClass parent_class;
};

struct _edwinspirePortsLastCallReceived {
	gchar* Number;
	GDateTime* Date;
	gboolean Read;
};

struct _edwinspirePortsConfigure {
	GObject parent_instance;
	edwinspirePortsConfigurePrivate * priv;
};

struct _edwinspirePortsConfigureClass {
	GObjectClass parent_class;
};

struct _edwinspirePortsSerialPort {
	edwinspirePortsConfigure parent_instance;
	edwinspirePortsSerialPortPrivate * priv;
};

struct _edwinspirePortsSerialPortClass {
	edwinspirePortsConfigureClass parent_class;
};

struct _edwinspirePortsModem {
	edwinspirePortsSerialPort parent_instance;
	edwinspirePortsModemPrivate * priv;
	edwinspirePortsLastCallReceived LastCall;
};

struct _edwinspirePortsModemClass {
	edwinspirePortsSerialPortClass parent_class;
};


GType edwinspire_ports_parity_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_hand_shaking_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_stop_bits_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_data_status_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_dtmf_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_response_code_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_cms_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_cme_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_response_get_type (void) G_GNUC_CONST;
edwinspirePortsResponse* edwinspire_ports_response_new_with_args (edwinspirePortsResponseCode Return, GeeArrayList* Lines, const gchar* raw, edwinspirePortsCME cmeError, edwinspirePortsCMS cmsError);
edwinspirePortsResponse* edwinspire_ports_response_construct_with_args (GType object_type, edwinspirePortsResponseCode Return, GeeArrayList* Lines, const gchar* raw, edwinspirePortsCME cmeError, edwinspirePortsCMS cmsError);
edwinspirePortsResponse* edwinspire_ports_response_new (void);
edwinspirePortsResponse* edwinspire_ports_response_construct (GType object_type);
gchar* edwinspire_ports_response_ToString (edwinspirePortsResponse* self);
GType edwinspire_ports_last_call_received_get_type (void) G_GNUC_CONST;
edwinspirePortsLastCallReceived* edwinspire_ports_last_call_received_dup (const edwinspirePortsLastCallReceived* self);
void edwinspire_ports_last_call_received_free (edwinspirePortsLastCallReceived* self);
void edwinspire_ports_last_call_received_copy (const edwinspirePortsLastCallReceived* self, edwinspirePortsLastCallReceived* dest);
void edwinspire_ports_last_call_received_destroy (edwinspirePortsLastCallReceived* self);
void edwinspire_ports_last_call_received_init (edwinspirePortsLastCallReceived *self);
GType edwinspire_ports_configure_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_serial_port_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_modem_get_type (void) G_GNUC_CONST;
edwinspirePortsModem* edwinspire_ports_modem_new (void);
edwinspirePortsModem* edwinspire_ports_modem_construct (GType object_type);
guint edwinspire_ports_modem_AutoBaudRate (edwinspirePortsModem* self);
edwinspirePortsResponse* edwinspire_ports_modem_Receive (edwinspirePortsModem* self, gdouble waitforresponse_ms, gboolean preventDetectFalseResponse);
gboolean edwinspire_ports_modem_Send (edwinspirePortsModem* self, const gchar* ComandoAT);
gboolean edwinspire_ports_modem_SendSimpleCommand (edwinspirePortsModem* self, const gchar* ATCommand, gdouble waitforresponse_ms);
gboolean edwinspire_ports_modem_DialCommand (edwinspirePortsModem* self, const gchar* number);
gboolean edwinspire_ports_modem_ATD (edwinspirePortsModem* self, const gchar* Number);
gboolean edwinspire_ports_modem_SetToDefaultConfiguration (edwinspirePortsModem* self);
gboolean edwinspire_ports_modem_ATZ (edwinspirePortsModem* self);
gboolean edwinspire_ports_modem_ATE (edwinspirePortsModem* self, gboolean enable);
gboolean edwinspire_ports_modem_ATV (edwinspirePortsModem* self, gboolean enable);
gboolean edwinspire_ports_modem_VerboseMode (edwinspirePortsModem* self, gboolean enable);
gboolean edwinspire_ports_modem_Echo (edwinspirePortsModem* self, gboolean enable);
gboolean edwinspire_ports_modem_ATS_Set (edwinspirePortsModem* self, gint _register_, gint value);
gboolean edwinspire_ports_modem_AutomaticAnswerControl_Set (edwinspirePortsModem* self, gint rings);
gint edwinspire_ports_modem_AutomaticAnswerControl (edwinspirePortsModem* self);
gint edwinspire_ports_modem_ATS0 (edwinspirePortsModem* self);
gboolean edwinspire_ports_modem_ATS0_Set (edwinspirePortsModem* self, gint rings);
gboolean edwinspire_ports_modem_EscapeSequenseCharacter_Set (edwinspirePortsModem* self, gint character);
gint edwinspire_ports_modem_EscapeSequenseCharacter (edwinspirePortsModem* self);
gint edwinspire_ports_modem_ATS2 (edwinspirePortsModem* self);
gboolean edwinspire_ports_modem_ATS2_Set (edwinspirePortsModem* self, gint character);
gboolean edwinspire_ports_modem_CommandLineTerminationCharacter_Set (edwinspirePortsModem* self, gint character);
gint edwinspire_ports_modem_CommandLineTerminationCharacter (edwinspirePortsModem* self);
gint edwinspire_ports_modem_ATS3 (edwinspirePortsModem* self);
gboolean edwinspire_ports_modem_ATS3_Set (edwinspirePortsModem* self, gint character);
gboolean edwinspire_ports_modem_ResponseFormattingCharacter_Set (edwinspirePortsModem* self, gint character);
gint edwinspire_ports_modem_ResponseFormattingCharacter (edwinspirePortsModem* self);
gint edwinspire_ports_modem_ATS4 (edwinspirePortsModem* self);
gboolean edwinspire_ports_modem_ATS4_Set (edwinspirePortsModem* self, gint character);
gboolean edwinspire_ports_modem_CommandLineEditingCharacter_Set (edwinspirePortsModem* self, gint character);
gint edwinspire_ports_modem_CommandLineEditingCharacter (edwinspirePortsModem* self);
gint edwinspire_ports_modem_ATS5 (edwinspirePortsModem* self);
gboolean edwinspire_ports_modem_ATS5_Set (edwinspirePortsModem* self, gint character);
gboolean edwinspire_ports_modem_ATS7_Set (edwinspirePortsModem* self, gint timeout);
gboolean edwinspire_ports_modem_CompletionConnectionTimeOut_Set (edwinspirePortsModem* self, gint timeout);
gint edwinspire_ports_modem_ATS7 (edwinspirePortsModem* self);
gint edwinspire_ports_modem_CompletionConnectionTimeOut (edwinspirePortsModem* self);
gboolean edwinspire_ports_modem_ATS10_Set (edwinspirePortsModem* self, gint delay);
gboolean edwinspire_ports_modem_AutomaticDisconnectDelayControl_Set (edwinspirePortsModem* self, gint delay);
gint edwinspire_ports_modem_ATS10 (edwinspirePortsModem* self);
gint edwinspire_ports_modem_AutomaticDisconnectDelayControl (edwinspirePortsModem* self);
gint edwinspire_ports_modem_ATS (edwinspirePortsModem* self, gint _register_);
gboolean edwinspire_ports_modem_AT (edwinspirePortsModem* self);
gboolean edwinspire_ports_modem_EscapeSequense (edwinspirePortsModem* self);
gboolean edwinspire_ports_modem_AcceptCall (edwinspirePortsModem* self);
gboolean edwinspire_ports_modem_ATA (edwinspirePortsModem* self);
edwinspirePortsConfigure* edwinspire_ports_configure_new (void);
edwinspirePortsConfigure* edwinspire_ports_configure_construct (GType object_type);
const gchar* edwinspire_ports_configure_get_Port (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_Port (edwinspirePortsConfigure* self, const gchar* value);
guint edwinspire_ports_configure_get_BaudRate (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_BaudRate (edwinspirePortsConfigure* self, guint value);
edwinspirePortsParity edwinspire_ports_configure_get_Parityp (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_Parityp (edwinspirePortsConfigure* self, edwinspirePortsParity value);
edwinspirePortsStopBits edwinspire_ports_configure_get_StopBitsp (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_StopBitsp (edwinspirePortsConfigure* self, edwinspirePortsStopBits value);
guint edwinspire_ports_configure_get_DataBits (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_DataBits (edwinspirePortsConfigure* self, guint value);
edwinspirePortsHandShaking edwinspire_ports_configure_get_HandShake (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_HandShake (edwinspirePortsConfigure* self, edwinspirePortsHandShaking value);
gboolean edwinspire_ports_configure_get_Enable (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_Enable (edwinspirePortsConfigure* self, gboolean value);
gulong edwinspire_ports_configure_get_BufferIn (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_BufferIn (edwinspirePortsConfigure* self, gulong value);
gulong edwinspire_ports_configure_get_BufferOut (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_BufferOut (edwinspirePortsConfigure* self, gulong value);
edwinspirePortsSerialPort* edwinspire_ports_serial_port_new_with_args (const gchar* Port_, guint Baudrate, guint DataBits, edwinspirePortsParity Parity_, edwinspirePortsStopBits StopBits_, edwinspirePortsHandShaking HS_);
edwinspirePortsSerialPort* edwinspire_ports_serial_port_construct_with_args (GType object_type, const gchar* Port_, guint Baudrate, guint DataBits, edwinspirePortsParity Parity_, edwinspirePortsStopBits StopBits_, edwinspirePortsHandShaking HS_);
edwinspirePortsSerialPort* edwinspire_ports_serial_port_new (void);
edwinspirePortsSerialPort* edwinspire_ports_serial_port_construct (GType object_type);
gchar* edwinspire_ports_serial_port_text_as_unicode (const gchar* text);
gboolean edwinspire_ports_serial_port_DiscardBuffer (edwinspirePortsSerialPort* self);
gchar** edwinspire_ports_serial_port_Get_PortName (edwinspirePortsSerialPort* self, int* result_length1);
gboolean edwinspire_ports_serial_port_Time (edwinspirePortsSerialPort* self, guint Time_);
gboolean edwinspire_ports_serial_port_Open (edwinspirePortsSerialPort* self);
glong edwinspire_ports_serial_port_Write (edwinspirePortsSerialPort* self, const gchar* data_);
gchar edwinspire_ports_serial_port_ReadChar (edwinspirePortsSerialPort* self);
void edwinspire_ports_serial_port_LogCommandAT (const gchar* text);
gdouble edwinspire_ports_serial_port_BaudRateTouseg (edwinspirePortsSerialPort* self);
gdouble edwinspire_ports_serial_port_BaudRateTomseg (edwinspirePortsSerialPort* self);
gchar* edwinspire_ports_serial_port_ReadLine (edwinspirePortsSerialPort* self, gdouble timeout_ms_for_line);
gchar* edwinspire_ports_serial_port_ReadLineWithoutStrip (edwinspirePortsSerialPort* self, gdouble timeout_ms_for_line);
gchar* edwinspire_ports_serial_port_Strip (const gchar* String);
gboolean edwinspire_ports_serial_port_Close (edwinspirePortsSerialPort* self);
gboolean edwinspire_ports_serial_port_get_LogModem (edwinspirePortsSerialPort* self);
void edwinspire_ports_serial_port_set_LogModem (edwinspirePortsSerialPort* self, gboolean value);
gboolean edwinspire_ports_serial_port_get_Blocking (edwinspirePortsSerialPort* self);
void edwinspire_ports_serial_port_set_Blocking (edwinspirePortsSerialPort* self, gboolean value);
gint edwinspire_ports_serial_port_get_BytesToRead (edwinspirePortsSerialPort* self);
gboolean edwinspire_ports_serial_port_get_IsOpen (edwinspirePortsSerialPort* self);


G_END_DECLS

#endif
