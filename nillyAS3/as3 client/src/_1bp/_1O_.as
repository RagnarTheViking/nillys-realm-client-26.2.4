package _1bp
{
   import _1xa._1eo;
   import _C_._1O_I_;
   import _1xa.AppendingLineBuilder;
   
   public class _1O_ extends _7J_
   {
       
      
      private var itemXML:XML;
      
      private var curItemXML:XML;
      
      private var _zw:XML;
      
      private var _1M_e:XML;
      
      public function _1O_()
      {
         super();
         _0N_9 = new AppendingLineBuilder();
      }
      
      override protected function compareSlots(param1:XML, param2:XML) : void
      {
         this.itemXML = param1;
         this.curItemXML = param2;
         this._zw = param1.Projectile[0];
         this._1M_e = param2.Projectile[0];
         this._bO_();
         this._04E_();
         _1U_C_[this._zw.toXMLString()] = true;
      }
      
      private function _bO_() : _1eo
      {
         var _loc1_:int = int(this._zw.MinDamage);
         var _loc2_:int = int(this._zw.MaxDamage);
         var _loc3_:int = int(this._1M_e.MinDamage);
         var _loc4_:int = int(this._1M_e.MaxDamage);
         var _loc5_:Number = (_loc1_ + _loc2_) / 2;
         var _loc6_:Number = (_loc3_ + _loc4_) / 2;
         var _loc7_:uint = _0dK_(_loc5_ - _loc6_);
         var _loc8_:String = _loc1_ == _loc2_?_loc2_.toString():_loc1_ + " - " + _loc2_;
         return _0N_9.pushParams(_1O_I_.DAMAGE,{"damage":"<font color=\"#" + _loc7_.toString(16) + "\">" + _loc8_ + "</font>"});
      }
      
      private function _04E_() : _1eo
      {
         var _loc1_:Number = Number(this._zw.Speed) * Number(this._zw.LifetimeMS) / 10000;
         var _loc2_:Number = Number(this._1M_e.Speed) * Number(this._1M_e.LifetimeMS) / 10000;
         var _loc3_:uint = _0dK_(_loc1_ - _loc2_);
         return _0N_9.pushParams(_1O_I_._04y,{"range":"<font color=\"#" + _loc3_.toString(16) + "\">" + _loc1_ + "</font>"});
      }
   }
}
