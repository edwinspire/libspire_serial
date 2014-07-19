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
		/**
        * Specifies the parity bit for the serial communication
        */
		[Description(nick = "Parity", blurb = "Specifies the parity bit for the serial communication")]
		        public enum Parity {
		 /**
         * Without testing calculation parity bit
         */
			[Description(nick = "NONE", blurb = "Without testing calculation parity bit")]
						NONE,
		 /**
         * Sets the parity bit so that the count of bits set is an odd number
         */
			[Description(nick = "ODD", blurb = "Sets the parity bit so that the count of bits set is an odd number")]
						ODD,  
		 /**
         * Sets the parity bit so that the count of bits set is an even number
         */
			[Description(nick = "EVEN", blurb = "Sets the parity bit so that the count of bits set is an even number")]
						EVEN, 
		 /**
         * Sets the parity bit set to 1
         */
			[Description(nick = "MARK", blurb = "Sets the parity bit set to 1")]
						MARK,
		 /**
         * Sets the parity bit set to 0
         */
			[Description(nick = "SPACE", blurb = "Sets the parity bit set to 0")]
						SPACE
		}
		

		/** 
        * Specifies the control protocol used to establish communication with the serial port
        */
		[Description(nick = "HandShaking", blurb = "Specifies the control protocol used to establish communication with the serial port")]
				public enum HandShaking {
			/** 
            * No control is not used for the protocol binding
            */
			[Description(nick = "NONE", blurb = "No control is not used for the protocol binding")]
						NONE,
			/** 
            * Controls hardware, Ready to Send (RTS) and Clear to Send (CTS)
            */						 
						[Description(nick = "RTS-CTS", blurb = "Controls hardware, Ready to Send (RTS) and Clear to Send (CTS)")]
						RTS_CTS, 
			/** 
            * Protocol software control XON / XOFF
            */
			[Description(nick = "XOnXOff", blurb = "Protocol software control XON / XOFF")]
						XOnXOff, 
			/** 
            * Use both RTS CTS and XON / XOFF
            */
			[Description(nick = "DTR-DSR", blurb = "Use both RTS-CTS and XON / XOFF")]
						DTR_DSR  
		}


			/** 
            * Specifies the number of stop bits used
            */
		[Description(nick = "StopBits", blurb = "Specifies the number of stop bits used")]
				public enum StopBits {
						/** 
                        * No stop bit is used
                        */
            			[Description(nick = "NONE", blurb = "No stop bit is used")]
						NONE, 
						/** 
                        * One stop bit is used
                        */						
						[Description(nick = "ONE", blurb = "One stop bit is used")]
						ONE,
						/** 
                        * Two stop bit is used
                        */						 
						[Description(nick = "TWO", blurb = "Two stop bit is used")]
						TWO
		}


			/** 
            * Specifies the state of the data modem
            */
		[Description(nick = "Data Status", blurb = "Specifies the state of the data modem")]
				public enum DataStatus {
			/** 
            * Modem not performing some action
            */
			[Description(nick = "None", blurb = "Modem not performing some action")]
						None,  
			/** 
            * Sending data to the modem
            */
			[Description(nick = "Sending", blurb = "Sending data to the modem")]
						Sending, 
			/** 
            * Receiving data from the modem
            */						
			[Description(nick = "Receiving", blurb = "Receiving data from the modem")]
						Receiving
		}
		
			/** 
            * DTMF Tones
            */	
    		[Description(nick = "DTMF", blurb = "DTMF tones")]
					public enum DTMF {
			[Description(nick = "0", blurb = "DTMF 0")]
								Zero, 
			[Description(nick = "1", blurb = "DTMF 1")]
								One, 
			[Description(nick = "2", blurb = "DTMF 2")]
								Two, 
			[Description(nick = "3", blurb = "DTMF 3")]
								Three, 
			[Description(nick = "4", blurb = "DTMF 4")]
								Four, 
			[Description(nick = "5", blurb = "DTMF 5")]
								Five, 
			[Description(nick = "6", blurb = "DTMF 6")]
								Six, 
			[Description(nick = "7", blurb = "DTMF 7")]
								Seven, 
			[Description(nick = "8", blurb = "DTMF 8")]
								Eigth, 
			[Description(nick = "9", blurb = "DTMF 9")]
								Nine, 
			[Description(nick = "*", blurb = "DTMF *")]
								Asterisc, 
			[Description(nick = "#", blurb = "DTMF #")]
						Sharp, 
			[Description(nick = "A", blurb = "DTMF A")]
						A, 
			[Description(nick = "B", blurb = "DTMF B")]
						B, 
			[Description(nick = "C", blurb = "DTMF C")]
						C, 
			[Description(nick = "D", blurb = "DTMF D")]
						D
		}
		
		
			/** 
            * Response from modem
            */	
		[Description(nick = "ResponseCode", blurb = "Response from modem")]
				public enum ResponseCode {
			OK = 0, 
			CONNECT = 1, 
			RING = 2, 
			NOCARRIER = 3, 
			ERROR = 4, 
			NODIALTONE = 5, 
			BUSY = 6, 
			NOANSWER = 7, 
			/** 
            * CMS (GSM Network Related) error
            */				
			[Description(nick = "ERROR CMS", blurb = "CMS (GSM Network Related) error")]
						ERROR_CMS = 98, 
			/** 
            * CME (GSM Equipment Related) error
            */	
			[Description(nick = "ERROR CME", blurb = "CME (GSM Equipment Related) error")]
						ERROR_CME = 99, 
			/** 
            * Unknown error
            */						
            			UNKNOW = 100
		}
		

		/**
         * CMS These are the error codes for +CMS ERROR.
         * 
         * 0-127   GSM 04.11 Annex E-2 values <<BR>>
         * 128-255   GSM 03.40 section 9.2.3.22 values
         */
		[Description(nick = "CMS", blurb = "These are the error codes for +CMS ERROR")]
				public enum CMS {
				        None = 0,
                    	UnassignedNumber = 1,
                        OperatorDeterminedBarring = 8, 
                        CallBared = 10,
                        ShortMessageTransferRejected = 21,
                        DestinationOutOfService = 27,
                        UnindentifiedSubscriber = 28,
                        FacilityRejected = 29,
                        UnknownSubscriber = 30,
                        NetworkOutOfOrder = 38,
                        TemporaryFailure = 41,
                        Congestion = 42,
                        RecourcesUnavailable = 47,
                        RequestedFacilityNotSubscribed = 50,
                        RequestedFacilityNotImplemented = 69,
                        InvalidShortMessageTransferReferenceValue = 81,
                        InvalidMessageUnspecified = 95,
                        InvalidMandatoryInformation = 96,
                        MessageTypeNonExistentOrNotImplemented = 97,
                        MessageNotCompatibleWithShortMessageProtocol = 98,
                        InformationElementNonExistentOrNotImplemente = 99,
                        ProtocolErrorUnspecified = 111,
                        InternetworkingUnspecified = 127,
                        TelematicInternetworkingNotSupported = 128,
                        ShortMessageType0NotSupported = 129,
                        CannotReplaceShortMessage = 130,
                        UnspecifiedTPPIDError = 143,
                        DataCodeSchemeNotSupported = 144,
                        MessageClassNotSupported = 145,
                        UnspecifiedTPDCSError = 159,
                        CommandCannotBeActioned = 160,
                        CommandUnsupported = 161,
                        UnspecifiedTPCommandError = 175,
                        TPDUNotSupported = 176,
                        SCBusy = 192,
                        NoSCSubscription = 193,
                        SCSystemFailure = 194,
                        InvalidSMEAddress = 195,
                        DestinationSMEBarred = 196,
                        SMRejectedDuplicateSM = 197,
                        TPVPFNotSupported = 198,
                        TPVPNotSupported = 199,
                        D0_SIM_SMS_StorageFull = 208,
                        NoSMS_StorageCapabilityInSIM = 209,
                        ErrorInMS = 210,
                        MemoryCapacityExceeded = 211,
                        SimApplicationToolkitBusy = 212,
                        SIM_DataDownloadError = 213,
                        UnspecifiedErrorCause = 255,
                        ME_Failure = 300,
                        SMS_ServiceOf_ME_Reserved = 301,
                        OperationNotAllowed = 302,
                        OperationNotSupported = 303,
                        Invalid_PDU_ModeParameter = 304,
                        Invalid_Text_ModeParameter = 305,
                        SIMNotInserted = 310,
                        SIM_PIN_Required = 311,
                        PH_SIM_PIN_Required = 312,
                        SIM_Failure = 313,
                        SIM_Busy = 314,
                        SIM_Wrong = 315,
                        SIM_PUK_Required = 316,
                        SIM_PIN2_Required = 317,
                        SIM_PUK2_Required = 318,
                        MemoryFailure = 320,
                        InvalidMemoryIndex = 321,
                        MemoryFull = 322,
                        SMSC_AddressUnknown = 330,
                        NoNetworkService = 331,
                        NetworkTimeout = 332,
                        No_CNMA_Expected = 340,
                        UnknownError = 500,
                        UserAbort = 512,
                        UnableToStore = 513,
                        InvalidStatus = 514,
                        DeviceBusyOrInvalidCharacterInString = 515,
                        InvalidLength = 516,
                        InvalidCharacterInPDU = 517,
                        InvalidParameter = 518,
                        InvalidLengthOrCharacter = 519,
                        InvalidCharacterInText = 520,
                        TimerExpired = 521,
                        OperationTemporaryNotAllowed = 522,
                        SIM_NotReady = 532,
                        CellBroadcastErrorUnknown = 534,
                        ProtocolStackBusy = 535	
				}		
		
		
			/** 
            * GSM Equipment and Network Error Codes
            */	
		[Description(nick = "CME", blurb = "GSM Equipment and Network Error Codes")]
				public enum CME {
			PhoneFailure = 0, 
			NoConnectionToPhone = 1, 
			PhoneAdaptorLinkReserved = 2, 
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
						PHSIM_PUK_Required = 48,
						Unknown = 100,						
						Illegal_MS = 103,
						Illegal_ME = 106,
						GPRS_Services_Not_Allowed = 107,
						PLMN_Not_Allowed = 111,
						Location_Area_Not_Allowed = 112,
						Roaming_Not_Allowed_In_This_Location_Area = 113,
						Operation_Temporary_Not_Allowed = 126,
						Service_Operation_Not_Supported = 132,
						Requested_Service_Option_Not_Subscribed = 133,
						Service_Option_Temporary_Out_Of_Order = 134,
						Unspecified_GPRS_Error = 148,
						PDP_Authentication_Failure = 149,
						Invalid_Mobile_Class = 150,
						Operation_Temporarily_Not_Allowed = 256,
						Call_Barred = 257,
						Phone_Is_Busy = 258,
						User_Abort = 259,
						Invalid_Dial_String = 260,
						SS_Not_Executed = 261,
						SIM_Blocked = 262,
						Invalid_Block = 263,
						None = 1000
		}
	}
}
