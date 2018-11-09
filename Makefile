# export CXX     ?= $(shell wx-config --cxx)
# export CFLAGS  ?= -O2 -Wall $(shell wx-config --cxxflags)
# export GUILIBS ?= $(shell wx-config --libs adv,core,base)
# export LIBS    ?= $(shell wx-config --libs base)
# export LDFLAGS ?= 

all:	ircDDBGateway/ircddbgatewayd

ircDDBGateway/ircddbgatewayd:	Common/Common.a ircDDB/IRCDDB.a
	$(MAKE) -C ircDDBGateway

ircDDBGatewayConfig/ircddbgatewayconfig:	GUICommon/GUICommon.a Common/Common.a
	$(MAKE) -C ircDDBGatewayConfig

APRSTransmit/aprstransmitd:	Common/Common.a
	$(MAKE) -C APRSTransmit

RemoteControl/remotecontrold:	Common/Common.a
	$(MAKE) -C RemoteControl

StarNetServer/starnetserverd:	Common/Common.a ircDDB/IRCDDB.a
	$(MAKE) -C StarNetServer

TextTransmit/texttransmitd:	Common/Common.a
	$(MAKE) -C TextTransmit

TimerControl/timercontrold:	Common/Common.a GUICommon/GUICommon.a
	$(MAKE) -C TimerControl

TimeServer/timeserverd:	Common/Common.a GUICommon/GUICommon.a
	$(MAKE) -C TimeServer

VoiceTransmit/voicetransmitd:	Common/Common.a
	$(MAKE) -C VoiceTransmit

GUICommon/GUICommon.a:
	$(MAKE) -C GUICommon

Common/Common.a:
	$(MAKE) -C Common

ircDDB/IRCDDB.a:
	$(MAKE) -C ircDDB

install:	all
	$(MAKE) -C Data install
	$(MAKE) -C APRSTransmit install
	$(MAKE) -C ircDDBGateway install
	$(MAKE) -C RemoteControl install
	$(MAKE) -C StarNetServer install
	$(MAKE) -C TextTransmit install
	$(MAKE) -C TimerControl install
	$(MAKE) -C TimeServer install
	$(MAKE) -C VoiceTransmit install
	$(MAKE) -C ircDDBGatewayConfig install

clean:
	$(MAKE) -C Common clean
	$(MAKE) -C ircDDB clean
	$(MAKE) -C GUICommon clean
	$(MAKE) -C APRSTransmit clean
	$(MAKE) -C ircDDBGateway clean
	$(MAKE) -C RemoteControl clean
	$(MAKE) -C StarNetServer clean
	$(MAKE) -C TextTransmit clean
	$(MAKE) -C TimerControl clean
	$(MAKE) -C TimeServer clean
	$(MAKE) -C VoiceTransmit clean
	$(MAKE) -C ircDDBGatewayConfig clean

