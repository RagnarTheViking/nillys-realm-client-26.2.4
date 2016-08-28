package _1bp
{
   import com.company.assembleegameclient.util.*;
   import _C_._1O_I_;
   import _1xa._dU_;
   import ToolTips._1l1;
   
   public class _0p6 extends _7J_
   {
       
      
      private var _0gT_:_1bp.GeneralProjectileComparison;
      
      private var condition:XMLList;
      
      private var _pW_:XMLList;
      
      public function _0p6()
      {
         this._0gT_ = new _1bp.GeneralProjectileComparison();
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var tagStr:String = null;
         var duration:Number = NaN;
         var conditionEffect:ConditionEffect = null;
         var itemXML:XML = param1;
         var curItemXML:XML = param2;
         this.condition = itemXML.Projectile.ConditionEffect.(text() == "Slowed" || text() == "Paralyzed" || text() == "Dazed");
         this._pW_ = curItemXML.Projectile.ConditionEffect.(text() == "Slowed" || text() == "Paralyzed" || text() == "Dazed");
         this._0gT_._zg(itemXML,curItemXML);
         _0N_9 = this._0gT_._0N_9;
         for(tagStr in this._0gT_._1U_C_)
         {
            _1U_C_[tagStr] = true;
         }
         if(this.condition.length() == 1 && this._pW_.length() == 1)
         {
            duration = Number(this.condition[0].@duration);
            conditionEffect = ConditionEffect.GetCondEffect(this.condition.text());
            _0N_9.pushParams(_1O_I_._19C_,{"effect":""});
            _0N_9.pushParams(_1O_I_._13N_,{
               "effect":new _dU_().setParams(conditionEffect.sbName_),
               "duration":duration
            },_1l1._07l(_Q_q),_1l1._1S_Z_());
            _1U_C_[this.condition[0].toXMLString()] = true;
         }
      }
   }
}
