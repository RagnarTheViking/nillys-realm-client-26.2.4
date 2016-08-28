package _1bp
{
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import _1xa._dU_;
   import ToolTips._1l1;
   
   public class _7W_ extends _7J_
   {
       
      
      public function _7W_()
      {
         super();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         _loc3_ = this._gk(param1);
         _loc4_ = this._gk(param2);
         _0N_9 = new AppendingLineBuilder();
         if(_loc3_ != null && _loc4_ != null)
         {
            _loc5_ = Number(_loc3_.@radius);
            _loc6_ = Number(_loc4_.@radius);
            _loc7_ = int(_loc3_.@totalDamage);
            _loc8_ = int(_loc4_.@totalDamage);
            _loc9_ = 0.5 * _loc5_ + 0.5 * _loc7_;
            _loc10_ = 0.5 * _loc6_ + 0.5 * _loc8_;
            _0N_9.pushParams(_1O_I_._0ao,{"effect":new _dU_().setParams(_1O_I_._1__F_,{
               "amount":_loc7_,
               "range":_loc5_
            }).setPrefix(_1l1._07l(_0dK_(_loc9_ - _loc10_))).setPostfix(_1l1._1S_Z_())});
            _1U_C_[_loc3_.toXMLString()] = true;
         }
      }
      
      private function _gk(param1:XML) : XML
      {
         var matches:XMLList = null;
         var xml:XML = param1;
         matches = xml.Activate.(text() == ActivateEffect.VAMPIREBLAST);
         return matches.length() >= 1?matches[0]:null;
      }
   }
}
