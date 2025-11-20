<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="XLXN_10" />
        <signal name="a" />
        <signal name="b" />
        <signal name="c" />
        <signal name="d" />
        <signal name="y" />
        <port polarity="Input" name="a" />
        <port polarity="Input" name="b" />
        <port polarity="Input" name="c" />
        <port polarity="Input" name="d" />
        <port polarity="Output" name="y" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="and2" name="XLXI_4">
            <blockpin signalname="b" name="I0" />
            <blockpin signalname="a" name="I1" />
            <blockpin signalname="XLXN_9" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_5">
            <blockpin signalname="d" name="I0" />
            <blockpin signalname="c" name="I1" />
            <blockpin signalname="XLXN_10" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_6">
            <blockpin signalname="XLXN_10" name="I0" />
            <blockpin signalname="XLXN_9" name="I1" />
            <blockpin signalname="y" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="240" y="288" name="XLXI_4" orien="R0" />
        <instance x="240" y="528" name="XLXI_5" orien="R0" />
        <instance x="640" y="416" name="XLXI_6" orien="R0" />
        <branch name="XLXN_9">
            <wire x2="560" y1="192" y2="192" x1="496" />
            <wire x2="560" y1="192" y2="288" x1="560" />
            <wire x2="640" y1="288" y2="288" x1="560" />
        </branch>
        <branch name="XLXN_10">
            <wire x2="560" y1="432" y2="432" x1="496" />
            <wire x2="560" y1="352" y2="432" x1="560" />
            <wire x2="640" y1="352" y2="352" x1="560" />
        </branch>
        <branch name="a">
            <wire x2="240" y1="160" y2="160" x1="208" />
        </branch>
        <iomarker fontsize="28" x="208" y="160" name="a" orien="R180" />
        <branch name="b">
            <wire x2="240" y1="224" y2="224" x1="208" />
        </branch>
        <iomarker fontsize="28" x="208" y="224" name="b" orien="R180" />
        <branch name="c">
            <wire x2="224" y1="400" y2="400" x1="208" />
            <wire x2="240" y1="400" y2="400" x1="224" />
        </branch>
        <branch name="d">
            <wire x2="240" y1="464" y2="464" x1="208" />
        </branch>
        <iomarker fontsize="28" x="208" y="464" name="d" orien="R180" />
        <branch name="y">
            <wire x2="928" y1="320" y2="320" x1="896" />
        </branch>
        <iomarker fontsize="28" x="928" y="320" name="y" orien="R0" />
        <iomarker fontsize="28" x="208" y="400" name="c" orien="R180" />
    </sheet>
</drawing>