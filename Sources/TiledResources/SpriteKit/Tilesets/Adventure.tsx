<?xml version="1.0" encoding="UTF-8"?>
<tileset version="1.4" tiledversion="1.4.2" name="Adventure" tilewidth="16" tileheight="16" tilecount="256" columns="16">
 <properties>
  <property name="filteringMode" value="nearest"/>
 </properties>
 <image source="../Images/Adventure Game.png" width="256" height="256"/>
 <tile id="247">
  <objectgroup draworder="index" id="2">
   <object id="1" type="SKSprite" x="4.09091" y="15.9091">
    <properties>
     <property name="allowsRotation" type="bool" value="false"/>
     <property name="isDynamic" type="bool" value="true"/>
     <property name="physicsCategory" type="int" value="1"/>
     <property name="physicsCollisionMask" type="int" value="1"/>
     <property name="physicsContactMask" type="int" value="1"/>
    </properties>
    <polygon points="0,0 1,-2.72727 -1.36364,-5.90909 1.90909,-8.45455 -1.18182,-12.0909 -1.09091,-14.9091 4.09091,-15.8182 8.90909,-14.5455 9,-12.1818 5.81818,-8.45455 8.81818,-5.90909 7,-2.81818 8,0.0909091"/>
   </object>
  </objectgroup>
 </tile>
</tileset>
