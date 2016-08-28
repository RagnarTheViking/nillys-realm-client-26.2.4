package _0mi
{
   import flash.display.Sprite;
   import _17B_._0o;
   import _wi.Injector;
   import flash.display.DisplayObject;
   import _1F_z._1Z_D_;
   
   public class _K_y extends Sprite
   {
       
      
      [Inject]
      public var _3q:_0o;
      
      [Inject]
      public var _T_X_:Injector;
      
      public var _1B_0:_0mi._13u;
      
      public var _E_L_:_0mi._13u;
      
      public var _O_M_:DisplayObject;
      
      private var petVO:_1Z_D_;
      
      public function _K_y()
      {
         super();
      }
      
      public function _G_4(param1:_1Z_D_) : void
      {
         this._3q._0X_m = 8;
         this.petVO = param1;
         this._E_L_ = this._0tb();
         this._1B_0 = this._0tb();
         this._0N_o(param1);
         this._rj();
      }
      
      public function _0oU_() : _1Z_D_
      {
         return this.petVO;
      }
      
      private function _0N_o(param1:_1Z_D_) : void
      {
         this._O_M_ = this._3q.create(param1,120);
         this._O_M_.x = -1 * this._O_M_.width / 2;
         this._O_M_.y = -1 * this._O_M_.height / 2;
         addChild(this._O_M_);
      }
      
      private function _rj() : void
      {
         this._E_L_._ds = 50;
         this._1B_0._ds = this._E_L_._ds * 1.5;
         var _loc1_:Number = 0.7;
         this._1B_0.width = this._E_L_.width * _loc1_;
         this._1B_0.height = this._E_L_.height * _loc1_;
         this._1B_0.alpha = this._E_L_.alpha = 0.7;
      }
      
      private function _0tb() : _0mi._13u
      {
         var _loc1_:_0mi._13u = this._T_X_.getInstance(_0mi._13u);
         addChild(_loc1_);
         return _loc1_;
      }
   }
}
