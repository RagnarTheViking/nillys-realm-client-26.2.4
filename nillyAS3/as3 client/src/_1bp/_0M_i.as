package _1bp
{
   import _1xa._dU_;
   import _C_._1O_I_;
   import ToolTips._1l1;
   
   public class _0M_i extends _7J_
   {
       
      
      private var _0gT_:_1bp.GeneralProjectileComparison;
      
      public function _0M_i()
      {
         this._0gT_ = new _1bp.GeneralProjectileComparison();
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var _loc3_:* = null;
         this._0gT_._zg(param1,param2);
         _0N_9 = this._0gT_._0N_9;
         for(_loc3_ in this._0gT_._1U_C_)
         {
            _1U_C_[_loc3_] = this._0gT_._1U_C_[_loc3_];
         }
         this._005(param1);
      }
      
      private function _005(param1:XML) : void
      {
         var tag:XML = null;
         var innerLineBuilder:_dU_ = null;
         var itemXML:XML = param1;
         if(itemXML.@id == "Shield of Ogmur")
         {
            tag = itemXML.ConditionEffect.(text() == "Armor Broken")[0];
            innerLineBuilder = new _dU_().setParams(_1O_I_._13N_,{
               "effect":_1O_I_._0A_J_(_1O_I_._a6),
               "duration":tag.@duration
            }).setPrefix(_1l1._07l(_fO_)).setPostfix(_1l1._1S_Z_());
            _0N_9.pushParams(_1O_I_._0A_I_,{"effect":innerLineBuilder});
            _1U_C_[tag.toXMLString()] = true;
         }
      }
   }
}
