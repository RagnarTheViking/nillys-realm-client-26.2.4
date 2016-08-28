package _18
{
   import flash.display.Sprite;
   import _1O_n._1S_u;
   import _05g._0s6;
   import com.company.assembleegameclient.objects.Player;
   import _S_b._1K_S_;
   
   public class _09V_ extends Sprite
   {
       
      
      private var _0V_N_:Sprite;
      
      private var _0M_M_:_1S_u;
      
      private var _aC_:_0s6;
      
      public function _09V_(param1:Player)
      {
         this._0V_N_ = new Sprite();
         this._aC_ = new _0s6();
         super();
         this.init(param1);
         this._0sF_();
         this._6P_();
      }
      
      private function init(param1:Player) : void
      {
         this._0M_M_ = new _1S_u(param1,param1,4);
         this._0V_N_.name = _1K_S_._uE_;
      }
      
      private function _0sF_() : void
      {
         this._0V_N_.addChild(this._0M_M_);
         this._0V_N_.addChild(this._aC_);
         addChild(this._0V_N_);
      }
      
      private function _6P_() : void
      {
         this._0V_N_.x = 7;
         this._0V_N_.y = 7;
         this._aC_.y = this._0M_M_.height + 4;
      }
   }
}
