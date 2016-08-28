package _1bp
{
   import _1xa._dU_;
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import ToolTips._1l1;
   
   public class PoisonComparison extends _7J_
   {
       
      
      public function PoisonComparison()
      {
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var activate:XMLList = null;
         var otherActivate:XMLList = null;
         var damage:int = 0;
         var otherDamage:int = 0;
         var radius:Number = NaN;
         var otherRadius:Number = NaN;
         var duration:Number = NaN;
         var otherDuration:Number = NaN;
         var avg:Number = NaN;
         var otherAvg:Number = NaN;
         var dataLineBuilder:_dU_ = null;
         var itemXML:XML = param1;
         var curItemXML:XML = param2;
         activate = itemXML.Activate.(text() == "PoisonGrenade");
         otherActivate = curItemXML.Activate.(text() == "PoisonGrenade");
         _0N_9 = new AppendingLineBuilder();
         if(activate.length() == 1 && otherActivate.length() == 1)
         {
            damage = int(activate[0].@totalDamage);
            otherDamage = int(otherActivate[0].@totalDamage);
            radius = Number(activate[0].@radius);
            otherRadius = Number(otherActivate[0].@radius);
            duration = Number(activate[0].@duration);
            otherDuration = Number(otherActivate[0].@duration);
            avg = 0.33 * damage + 0.33 * radius + 0.33 * duration;
            otherAvg = 0.33 * otherDamage + 0.33 * otherRadius + 0.33 * otherDuration;
            dataLineBuilder = new _dU_().setParams(_1O_I_._tl,{
               "damage":damage.toString(),
               "duration":duration.toString(),
               "radius":radius.toString()
            }).setPrefix(_1l1._07l(_0dK_(avg - otherAvg))).setPostfix(_1l1._1S_Z_());
            _0N_9.pushParams(_1O_I_._0L_a,{"data":dataLineBuilder});
            _1U_C_[activate[0].toXMLString()] = true;
         }
      }
   }
}
