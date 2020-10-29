<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.4" tiledversion="1.4.2" name="Animation" tilewidth="16" tileheight="16" tilecount="16" columns="4">
 <properties>
  <property name="User Property" value=""/>
  <property name="filteringMode" value="nearest"/>
 </properties>
 <image source="../Images/Animation.png" width="64" height="64"/>
 <tile id="0">
  <animation>
   <frame tileid="0" duration="20"/>
   <frame tileid="1" duration="20"/>
   <frame tileid="2" duration="20"/>
   <frame tileid="3" duration="20"/>
  </animation>
 </tile>
 <tile id="4">
  <animation>
   <frame tileid="4" duration="10000"/>
   <frame tileid="5" duration="1000"/>
   <frame tileid="6" duration="1000"/>
   <frame tileid="7" duration="2000"/>
  </animation>
 </tile>
 <tile id="8">
  <properties>
   <property name="filteringMode" value="nearest"/>
  </properties>
  <objectgroup draworder="index" id="2">
   <object id="1" x="3.25" y="3.25" width="9.75" height="9.75"/>
  </objectgroup>
  <animation>
   <frame tileid="11" duration="1000"/>
   <frame tileid="8" duration="1000"/>
   <frame tileid="9" duration="1000"/>
   <frame tileid="10" duration="1000"/>
  </animation>
 </tile>
 <tile id="9">
  <objectgroup draworder="index" id="2">
   <object id="1" x="3.25" y="3" width="9.625" height="9.75">
    <ellipse/>
   </object>
  </objectgroup>
 </tile>
 <tile id="10">
  <objectgroup draworder="index" id="2">
   <object id="1" x="3" y="12.75">
    <polygon points="0,0 5,-9.625 9.875,0.25"/>
   </object>
  </objectgroup>
 </tile>
 <tile id="11">
  <properties>
   <property name="filteringMode" value="nearest"/>
  </properties>
  <objectgroup draworder="index" id="2">
   <object id="1" x="3.125" y="3">
    <polygon points="0,0 9.875,0 4.875,10.25"/>
   </object>
  </objectgroup>
 </tile>
</tileset>
