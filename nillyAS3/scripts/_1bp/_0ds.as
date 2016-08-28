package _1bp
{
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import _1xa._dU_;
   import ToolTips._1l1;
   
   public class _0ds extends _7J_
   {
       
      
      public function _0ds()
      {
         super();
      }
      
      private function _08M_(param1:XML) : XML
      {
         var matches:XMLList = null;
         var xml:XML = param1;
         matches = xml.Activate.(text() == "Trap");
         if(matches.length() >= 1)
         {
            return matches[0];
         }
         return null;
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var trap:XML = null;
         var otherTrap:XML = null;
         var tag:XML = null;
         var radius:Number = NaN;
         var otherRadius:Number = NaN;
         var damage:int = 0;
         var otherDamage:int = 0;
         var duration:int = 0;
         var otherDuration:int = 0;
         var avg:Number = NaN;
         var otherAvg:Number = NaN;
         var textColor:uint = 0;
         var itemXML:XML = param1;
         var curItemXML:XML = param2;
         trap = this._08M_(itemXML);
         otherTrap = this._08M_(curItemXML);
         _0N_9 = new AppendingLineBuilder();
         if(trap != null && otherTrap != null)
         {
            if(itemXML.@id == "Coral Venom Trap")
            {
               tag = itemXML.Activate.(text() == "Trap")[0];
               _0N_9.pushParams(_1O_I_._0j9,{"data":new _dU_().setParams(_1O_I_._1__F_,{
                  "amount":tag.@totalDamage,
                  "range":tag.@radius
               }).setPrefix(_1l1._07l(_fO_)).setPostfix(_1l1._1S_Z_())});
               _0N_9.pushParams(_1O_I_._13N_,{
                  "effect":new _dU_().setParams(_1O_I_._1T_v),
                  "duration":tag.@condDuration
               },_1l1._07l(_fO_),_1l1._1S_Z_());
               _1U_C_[tag.toXMLString()] = true;
            }
            else
            {
               radius = Number(trap.@radius);
               otherRadius = Number(otherTrap.@radius);
               damage = int(trap.@totalDamage);
               otherDamage = int(otherTrap.@totalDamage);
               duration = int(trap.@condDuration);
               otherDuration = int(otherTrap.@condDuration);
               avg = 0.33 * radius + 0.33 * damage + 0.33 * duration;
               otherAvg = 0.33 * otherRadius + 0.33 * otherDamage + 0.33 * otherDuration;
               textColor = _0dK_(avg - otherAvg);
               _0N_9.pushParams(_1O_I_._0j9,{"data":new _dU_().setParams(_1O_I_._1__F_,{
                  "amount":trap.@totalDamage,
                  "range":trap.@radius
               }).setPrefix(_1l1._07l(textColor)).setPostfix(_1l1._1S_Z_())});
               _0N_9.pushParams(_1O_I_._13N_,{
                  "effect":new _dU_().setParams(_1O_I_._1J_f),
                  "duration":trap.@condDuration
               },_1l1._07l(textColor),_1l1._1S_Z_());
               _1U_C_[trap.toXMLString()] = true;
            }
         }
      }
   }
}
