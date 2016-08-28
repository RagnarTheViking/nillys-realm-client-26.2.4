package _1U_P_
{
   import flash.display.Sprite;
   import _1gF_._I_a;
   import _1xa._dU_;
   import flash.filters.DropShadowFilter;
   import _C_._1O_I_;
   
   public class _08Q_ extends Sprite
   {
       
      
      private const _1t:_I_a = this._P_L_();
      
      private const _0N_5:_dU_ = new _dU_();
      
      public function _08Q_()
      {
         super();
      }
      
      private function _P_L_() : _I_a
      {
         var _loc1_:_I_a = new _I_a();
         _loc1_.setSize(24).setBold(true).setColor(16777215);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         addChild(_loc1_);
         return _loc1_;
      }
      
      public function _E_j(param1:int) : void
      {
         this._1t.setStringBuilder(this._0N_5.setParams(_1O_I_._0ks,{"waveNumber":param1}));
      }
   }
}
