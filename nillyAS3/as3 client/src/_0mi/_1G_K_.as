package _0mi
{
   import flash.display.Sprite;
   import flash.display.DisplayObject;
   import _17B_._0o;
   import _wi.Injector;
   import _17B_._I_4;
   import Packets._mz;
   import _1F_z._1Z_D_;
   import kabam.rotmg.assets.Assets;
   
   public class _1G_K_ extends Sprite
   {
       
      
      public const background:DisplayObject = new Assets.EvolveBackground();
      
      public const _0re:DisplayObject = new Assets.EvolveBackground();
      
      [Inject]
      public var _3q:_0o;
      
      [Inject]
      public var _T_X_:Injector;
      
      [Inject]
      public var _0X_9:_0mi._1__1;
      
      public var _0qx:_I_4;
      
      public var _oZ_:_0mi._K_y;
      
      private var _0jW_:_mz;
      
      public function _1G_K_()
      {
         super();
         addChild(this.background);
         addChild(this._0re);
      }
      
      public function _03f(param1:_mz) : void
      {
         this._3q._0X_m = 6;
         this._0jW_ = param1;
         this._K_N_(param1._0qx);
         this._wK_(param1._aQ_);
         addChild(this._0X_9);
         this._0X_9._1R_q.addOnce(this._1N_4);
         this._0X_9.play();
      }
      
      public function _1m4() : _mz
      {
         return this._0jW_;
      }
      
      private function _wK_(param1:_1Z_D_) : void
      {
         this._oZ_ = this._T_X_.getInstance(_0mi._K_y);
         this._oZ_._G_4(param1);
         this._oZ_.mask = this._0re;
         this._oZ_.x = this.background.width / 2;
         this._oZ_.y = this.background.height / 2;
      }
      
      private function _K_N_(param1:_1Z_D_) : void
      {
         this._0qx = this._3q.create(param1,100);
         this._0qx.x = (this.background.width - this._0qx.width) / 2;
         this._0qx.y = (this.background.height - this._0qx.height) / 2;
         addChild(this._0qx);
      }
      
      private function _1N_4() : void
      {
         removeChild(this._0qx);
         addChildAt(this._oZ_,getChildIndex(this._0X_9));
      }
   }
}
