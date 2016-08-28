package _1bp
{
   import _1xa._dU_;
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import ToolTips._1l1;
   
   public class _1vW_ extends _7J_
   {
       
      
      public function _1vW_()
      {
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var result:XMLList = null;
         var otherResult:XMLList = null;
         var damage:int = 0;
         var otherDamage:int = 0;
         var textColor:uint = 0;
         var targets:int = 0;
         var otherTargets:int = 0;
         var innerLineBuilder:_dU_ = null;
         var condition:String = null;
         var duration:Number = NaN;
         var compositeStr:String = null;
         var htmlStr:String = null;
         var itemXML:XML = param1;
         var curItemXML:XML = param2;
         result = itemXML.Activate.(text() == ActivateEffect.LIGHTNING);
         otherResult = curItemXML.Activate.(text() == ActivateEffect.LIGHTNING);
         _0N_9 = new AppendingLineBuilder();
         if(result.length() == 1 && otherResult.length() == 1)
         {
            damage = int(result[0].@totalDamage);
            otherDamage = int(otherResult[0].@totalDamage);
            textColor = _0dK_(damage - otherDamage);
            targets = int(result[0].@maxTargets);
            otherTargets = int(otherResult[0].@maxTargets);
            innerLineBuilder = new _dU_().setParams(_1O_I_._I_s,{
               "damage":damage.toString(),
               "targets":targets.toString()
            }).setPrefix(_1l1._07l(_0dK_(damage - otherDamage))).setPostfix(_1l1._1S_Z_());
            _0N_9.pushParams(_1O_I_._1W_J_,{"data":innerLineBuilder});
            _1U_C_[result[0].toXMLString()] = true;
         }
         if(String(itemXML.Activate.@condEffect))
         {
            condition = itemXML.Activate.@condEffect;
            duration = itemXML.Activate.@condDuration;
            compositeStr = " " + condition + " for " + duration + " secs\n";
            htmlStr = "Shot Effect:\n" + _6Z_(compositeStr,_Q_q);
            _0N_9.pushParams(_1O_I_._19C_,{"effect":""});
            _0N_9.pushParams(_1O_I_._13N_,{
               "effect":condition,
               "duration":duration.toString()
            },_1l1._07l(_Q_q),_1l1._1S_Z_());
         }
      }
   }
}
