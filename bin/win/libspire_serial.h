/* libspire_serial.h generated by valac 0.12.0, the Vala compiler, do not modify */


#ifndef __R__OPERADORES_EDWINDLC_PROGRAMACION_PROYECTOSSOFTWARE_SOFTWARE_VALA_PROYECTOSVALA_PROYECTS_LIBSPIRE_SERIAL_BIN_WIN_LIBSPIRE_SERIAL_H__
#define __R__OPERADORES_EDWINDLC_PROGRAMACION_PROYECTOSSOFTWARE_SOFTWARE_VALA_PROYECTOSVALA_PROYECTS_LIBSPIRE_SERIAL_BIN_WIN_LIBSPIRE_SERIAL_H__

#include <glib.h>
#include <glib-object.h>
#include <stdlib.h>
#include <string.h>
#include <gee.h>

G_BEGIN_DECLS


#define EDWINSPIRE_PORTS_TYPE_HAND_SHAKING (edwinspire_ports_hand_shaking_get_type ())

#define EDWINSPIRE_PORTS_TYPE_PARITY (edwinspire_ports_parity_get_type ())

#define EDWINSPIRE_PORTS_TYPE_STOP_BITS (edwinspire_ports_stop_bits_get_type ())

#define EDWINSPIRE_PORTS_TYPE_DATA_STATUS (edwinspire_ports_data_status_get_type ())

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

#define EDWINSPIRE_PORTS_TYPE_DTMF (edwinspire_ports_dtmf_get_type ())

#define EDWINSPIRE_PORTS_TYPE_RESPONSE_CODE (edwinspire_ports_response_code_get_type ())

#define EDWINSPIRE_PORTS_TYPE_RESPONSE (edwinspire_ports_response_get_type ())
#define EDWINSPIRE_PORTS_RESPONSE(obj) (G_TYPE_CHECK_INSTANCE_CAST ((obj), EDWINSPIRE_PORTS_TYPE_RESPONSE, edwinspirePortsResponse))
#define EDWINSPIRE_PORTS_RESPONSE_CLASS(klass) (G_TYPE_CHECK_CLASS_CAST ((klass), EDWINSPIRE_PORTS_TYPE_RESPONSE, edwinspirePortsResponseClass))
#define EDWINSPIRE_PORTS_IS_RESPONSE(obj) (G_TYPE_CHECK_INSTANCE_TYPE ((obj), EDWINSPIRE_PORTS_TYPE_RESPONSE))
#define EDWINSPIRE_PORTS_IS_RESPONSE_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), EDWINSPIRE_PORTS_TYPE_RESPONSE))
#define EDWINSPIRE_PORTS_RESPONSE_GET_CLASS(obj) (G_TYPE_INSTANCE_GET_CLASS ((obj), EDWINSPIRE_PORTS_TYPE_RESPONSE, edwinspirePortsResponseClass))

typedef struct _edwinspirePortsResponse edwinspirePortsResponse;
typedef struct _edwinspirePortsResponseClass edwinspirePortsResponseClass;
typedef struct _edwinspirePortsResponsePrivate edwinspirePortsResponsePrivate;

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
	EDWINSPIRE_PORTS_HAND_SHAKING_NONE,
	EDWINSPIRE_PORTS_HAND_SHAKING_RTS_CTS,
	EDWINSPIRE_PORTS_HAND_SHAKING_XOnXOff,
	EDWINSPIRE_PORTS_HAND_SHAKING_DTR_DSR
} edwinspirePortsHandShaking;

typedef enum  {
	EDWINSPIRE_PORTS_PARITY_NONE,
	EDWINSPIRE_PORTS_PARITY_ODD,
	EDWINSPIRE_PORTS_PARITY_EVEN,
	EDWINSPIRE_PORTS_PARITY_MARK,
	EDWINSPIRE_PORTS_PARITY_SPACE
} edwinspirePortsParity;

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

typedef enum  {
	EDWINSPIRE_PORTS_DTMF_Zero,
	EDWINSPIRE_PORTS_DTMF_One,
	EDWINSPIRE_PORTS_DTMF_Two,
	EDWINSPIRE_PORTS_DTMF_Three,
	EDWINSPIRE_PORTS_DTMF_Four,
	EDWINSPIRE_PORTS_DTMF_Five,
	EDWINSPIRE_PORTS_DTMF_Six,
	EDWINSPIRE_PORTS_DTMF_Sever,
	EDWINSPIRE_PORTS_DTMF_Eigth,
	EDWINSPIRE_PORTS_DTMF_Nine,
	EDWINSPIRE_PORTS_DTMF_Asterisc,
	EDWINSPIRE_PORTS_DTMF_Sharp
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
	EDWINSPIRE_PORTS_RESPONSE_CODE_ERROR_CMS = 99,
	EDWINSPIRE_PORTS_RESPONSE_CODE_UNKNOW = 100
} edwinspirePortsResponseCode;

struct _edwinspirePortsResponse {
	GObject parent_instance;
	edwinspirePortsResponsePrivate * priv;
	edwinspirePortsResponseCode Return;
	GeeArrayList* Lines;
};

struct _edwinspirePortsResponseClass {
	GObjectClass parent_class;
};

struct _edwinspirePortsModem {
	edwinspirePortsSerialPort parent_instance;
	edwinspirePortsModemPrivate * priv;
};

struct _edwinspirePortsModemClass {
	edwinspirePortsSerialPortClass parent_class;
};


GType edwinspire_ports_hand_shaking_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_parity_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_stop_bits_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_data_status_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_configure_get_type (void) G_GNUC_CONST;
edwinspirePortsConfigure* edwinspire_ports_configure_new (void);
edwinspirePortsConfigure* edwinspire_ports_configure_construct (GType object_type);
const gchar* edwinspire_ports_configure_get_Port (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_Port (edwinspirePortsConfigure* self, const gchar* value);
guint edwinspire_ports_configure_get_BaudRate (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_BaudRate (edwinspirePortsConfigure* self, guint value);
edwinspirePortsParity edwinspire_ports_configure_get_Parity (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_Parity (edwinspirePortsConfigure* self, edwinspirePortsParity value);
edwinspirePortsStopBits edwinspire_ports_configure_get_StopBits (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_StopBits (edwinspirePortsConfigure* self, edwinspirePortsStopBits value);
guint edwinspire_ports_configure_get_DataBits (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_DataBits (edwinspirePortsConfigure* self, guint value);
edwinspirePortsHandShaking edwinspire_ports_configure_get_HandShake (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_HandShake (edwinspirePortsConfigure* self, edwinspirePortsHandShaking value);
guint edwinspire_ports_configure_get_TimeOut (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_TimeOut (edwinspirePortsConfigure* self, guint value);
gboolean edwinspire_ports_configure_get_Enable (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_Enable (edwinspirePortsConfigure* self, gboolean value);
gulong edwinspire_ports_configure_get_BufferIn (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_BufferIn (edwinspirePortsConfigure* self, gulong value);
gulong edwinspire_ports_configure_get_BufferOut (edwinspirePortsConfigure* self);
void edwinspire_ports_configure_set_BufferOut (edwinspirePortsConfigure* self, gulong value);
GType edwinspire_ports_serial_port_get_type (void) G_GNUC_CONST;
edwinspirePortsSerialPort* edwinspire_ports_serial_port_new_with_args (const gchar* Port_, guint Baudrate, guint DataBits, edwinspirePortsParity Parity_, edwinspirePortsStopBits StopBits_, edwinspirePortsHandShaking HS);
edwinspirePortsSerialPort* edwinspire_ports_serial_port_construct_with_args (GType object_type, const gchar* Port_, guint Baudrate, guint DataBits, edwinspirePortsParity Parity_, edwinspirePortsStopBits StopBits_, edwinspirePortsHandShaking HS);
edwinspirePortsSerialPort* edwinspire_ports_serial_port_new (void);
edwinspirePortsSerialPort* edwinspire_ports_serial_port_construct (GType object_type);
gboolean edwinspire_ports_serial_port_DiscardBuffer (edwinspirePortsSerialPort* self);
gchar** edwinspire_ports_serial_port_Get_PortName (edwinspirePortsSerialPort* self, int* result_length1);
gboolean edwinspire_ports_serial_port_Time (edwinspirePortsSerialPort* self, guint Time_);
gboolean edwinspire_ports_serial_port_Open (edwinspirePortsSerialPort* self);
glong edwinspire_ports_serial_port_Write (edwinspirePortsSerialPort* self, const gchar* Data_);
gchar edwinspire_ports_serial_port_ReadChar (edwinspirePortsSerialPort* self);
gchar* edwinspire_ports_serial_port_ReadLine (edwinspirePortsSerialPort* self, guint timeout);
gboolean edwinspire_ports_serial_port_Close (edwinspirePortsSerialPort* self);
gboolean edwinspire_ports_serial_port_get_Blocking (edwinspirePortsSerialPort* self);
void edwinspire_ports_serial_port_set_Blocking (edwinspirePortsSerialPort* self, gboolean value);
gint edwinspire_ports_serial_port_get_BytesToRead (edwinspirePortsSerialPort* self);
gboolean edwinspire_ports_serial_port_get_IsOpen (edwinspirePortsSerialPort* self);
GType edwinspire_ports_dtmf_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_response_code_get_type (void) G_GNUC_CONST;
GType edwinspire_ports_response_get_type (void) G_GNUC_CONST;
edwinspirePortsResponse* edwinspire_ports_response_new_with_args (edwinspirePortsResponseCode Return, GeeArrayList* Lines);
edwinspirePortsResponse* edwinspire_ports_response_construct_with_args (GType object_type, edwinspirePortsResponseCode Return, GeeArrayList* Lines);
edwinspirePortsResponse* edwinspire_ports_response_new (void);
edwinspirePortsResponse* edwinspire_ports_response_construct (GType object_type);
GType edwinspire_ports_modem_get_type (void) G_GNUC_CONST;
edwinspirePortsModem* edwinspire_ports_modem_new (void);
edwinspirePortsModem* edwinspire_ports_modem_construct (GType object_type);
guint edwinspire_ports_modem_TestTimeOutMin (edwinspirePortsModem* self);
edwinspirePortsResponse* edwinspire_ports_modem_Receive (edwinspirePortsModem* self, gint waitforresponse_ms, gboolean preventDetectFalseResponse);
gboolean edwinspire_ports_modem_Send (edwinspirePortsModem* self, const gchar* ComandoAT);
gboolean edwinspire_ports_modem_SendSimpleCommand (edwinspirePortsModem* self, const gchar* ATCommand);
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


G_END_DECLS

#endif
