package _1bp
{
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import _1xa._dU_;
   import ToolTips._1l1;
   
   public class _0s extends _7J_
   {
       
      
      public function _0s()
      {
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:uint = 0;
         _loc3_ = this._102(param1);
         _loc4_ = this._102(param2);
         _0N_9 = new AppendingLineBuilder();
         if(_loc3_ != null && _loc4_ != null)
         {
            _loc5_ = int(_loc3_.@duration);
            _loc6_ = int(_loc4_.@duration);
            _loc7_ = _0dK_(_loc5_ - _loc6_);
            _0N_9.pushParams(_1O_I_._0B_h,{"stasis":new _dU_().setParams(_1O_I_._1rK_,{"duration":_loc5_}).setPrefix(_1l1._07l(_loc7_)).setPostfix(_1l1._1S_Z_())});
            _1U_C_[_loc3_.toXMLString()] = true;
            this._0A_c(param1);
         }
      }
      
      private function _102(param1:XML) : XML
      {
         var matches:XMLList = null;
         var orbXML:XML = param1;
         matches = orbXML.Activate.(text() == "StasisBlast");
         return matches.length() == 1?matches[0]:null;
      }
      
      private function _0A_c(param1:XML) : void
      {
         var selfTags:XMLList = null;
         var speedy:XML = null;
         var damaging:XML = null;
         var itemXML:XML = param1;
         if(itemXML.@id == "Orb of Conflict")
         {
            selfTags = itemXML.Activate.(text() == "ConditionEffectSelf");
            speedy = selfTags.(@effect == "Speedy")[0];
            damaging = selfTags.(@effect == "Damaging")[0];
            _0N_9.pushParams(_1O_I_._1N_G_,{"effect":""});
            _0N_9.pushParams(_1O_I_._13N_,{
               "effect":_1O_I_._0A_J_(_1O_I_._S_M_),
               "duration":speedy.@duration
            },_1l1._07l(_fO_),_1l1._1S_Z_());
            _0N_9.pushParams(_1O_I_._1N_G_,{"effect":""});
            _0N_9.pushParams(_1O_I_._13N_,{
               "effect":_1O_I_._0A_J_(_1O_I_._0jL_),
               "duration":damaging.@duration
            },_1l1._07l(_fO_),_1l1._1S_Z_());
            _1U_C_[speedy.toXMLString()] = true;
            _1U_C_[damaging.toXMLString()] = true;
         }
      }
   }
}
