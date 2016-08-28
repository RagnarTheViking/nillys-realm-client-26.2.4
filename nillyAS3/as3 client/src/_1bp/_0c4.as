package _1bp
{
   import _1xa._dU_;
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import ToolTips._1l1;
   
   public class _0c4 extends _7J_
   {
       
      
      public function _0c4()
      {
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var nova:XMLList = null;
         var otherNova:XMLList = null;
         var tag:XML = null;
         var range:int = 0;
         var otherRange:int = 0;
         var amount:int = 0;
         var otherAmount:int = 0;
         var wavg:Number = NaN;
         var otherWavg:Number = NaN;
         var innerStringBuilder:_dU_ = null;
         var itemXML:XML = param1;
         var curItemXML:XML = param2;
         nova = itemXML.Activate.(text() == "HealNova");
         otherNova = curItemXML.Activate.(text() == "HealNova");
         _0N_9 = new AppendingLineBuilder();
         if(nova.length() == 1 && otherNova.length() == 1)
         {
            range = int(itemXML.Activate.@range);
            otherRange = int(curItemXML.Activate.@range);
            amount = int(itemXML.Activate.@amount);
            otherAmount = int(curItemXML.Activate.@amount);
            wavg = 0.5 * range + 0.5 * amount;
            otherWavg = 0.5 * otherRange + 0.5 * otherAmount;
            if(itemXML.@id == "Tome of Purification")
            {
               range = 6;
            }
            innerStringBuilder = new _dU_().setParams(_1O_I_._1__F_,{
               "amount":amount.toString(),
               "range":range.toString()
            }).setPrefix(_1l1._07l(_0dK_(wavg - otherWavg))).setPostfix(_1l1._1S_Z_());
            _0N_9.pushParams(_1O_I_._F_h,{"effect":innerStringBuilder});
            _1U_C_[nova.toXMLString()] = true;
         }
         if(itemXML.@id == "Tome of Purification")
         {
            tag = itemXML.Activate.(text() == "RemoveNegativeConditions")[0];
            _0N_9.pushParams(_1O_I_._0z9,{},_1l1._07l(_fO_),_1l1._1S_Z_());
            _1U_C_[tag.toXMLString()] = true;
         }
         else if(itemXML.@id == "Tome of Holy Protection")
         {
            tag = itemXML.Activate.(text() == "ConditionEffectSelf")[0];
            _0N_9.pushParams(_1O_I_._1N_G_,{"effect":""});
            _0N_9.pushParams(_1O_I_._13N_,{
               "effect":_1O_I_._0A_J_(_1O_I_._2J_),
               "duration":tag.@duration
            },_1l1._07l(_fO_),_1l1._1S_Z_());
            _1U_C_[tag.toXMLString()] = true;
         }
      }
   }
}
