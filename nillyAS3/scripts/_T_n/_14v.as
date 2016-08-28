package _T_n
{
   import flash.display.Sprite;
   import _1un._N_9;
   import _f7.Signal;
   import _E_Y_._u6;
   import _E_Y_._0rZ_;
   import _1un.Size;
   import flash.display.DisplayObject;
   
   public class _14v extends Sprite implements _N_9
   {
      
      public static const _1Q_C_:int = 2;
      
      public static const _0hX_:int = _T_n._11p.WIDTH + _1Q_C_;
       
      
      public const _0o0:Signal = new Signal(Boolean);
      
      private var layout:_u6;
      
      private var list:_0rZ_;
      
      private var scrollbar:_T_n._11p;
      
      private var isEnabled:Boolean = true;
      
      private var size:Size;
      
      public function _14v()
      {
         super();
         this._0X_w();
         this._1Y_R_();
         this._0K_o();
      }
      
      public function _L_X_() : Boolean
      {
         return this.isEnabled;
      }
      
      public function _1E_k(param1:Boolean) : void
      {
         this.isEnabled = param1;
         this.scrollbar._1E_k(param1);
      }
      
      public function setSize(param1:Size) : void
      {
         this.size = param1;
         if(this._1uN_())
         {
            param1 = new Size(param1.width - _0hX_,param1.height);
         }
         this.list.setSize(param1);
         this._D_e();
      }
      
      public function _1X_Q_() : Size
      {
         return this.size;
      }
      
      public function _1gC_(param1:int) : void
      {
         this.layout._1gC_(param1);
         this.list._1A_s();
         this._D_e();
      }
      
      public function addItem(param1:DisplayObject) : void
      {
         this.list.addItem(param1);
      }
      
      public function setItems(param1:Vector.<DisplayObject>) : void
      {
         this.list.setItems(param1);
      }
      
      public function _hD_(param1:int) : DisplayObject
      {
         return this.list._hD_(param1);
      }
      
      public function _0M_t() : int
      {
         return this.list._0M_t();
      }
      
      public function _sz() : int
      {
         return this.list._1L_J_().height;
      }
      
      private function _0X_w() : void
      {
         this.layout = new _u6();
      }
      
      public function _1uN_() : Boolean
      {
         return this.scrollbar.visible;
      }
      
      private function _1Y_R_() : void
      {
         this.list = new _0rZ_();
         this.list._J_v.add(this._D_e);
         this.list._Z_a(this.layout);
         addChild(this.list);
      }
      
      private function _D_e() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = false;
         var _loc5_:* = undefined;
         var _loc3_:Size = this.list._1X_Q_();
         var _loc4_:int = _loc3_.height;
         _loc1_ = this.list._1L_J_().height;
         _loc5_ = _loc1_ > _loc4_;
         _loc2_ = this.scrollbar.visible != _loc5_;
         this.scrollbar.visible = _loc5_;
         _loc5_ && this._0sa(_loc4_,_loc1_);
         _loc2_ && this._0k9(_loc5_);
      }
      
      private function _0k9(param1:Boolean) : void
      {
         this.setSize(this.size);
         this._0o0.dispatch(param1);
      }
      
      private function _0sa(param1:int, param2:int) : void
      {
         var _loc3_:int = param1 * (param1 / param2);
         this.scrollbar.setSize(_loc3_,param1);
         this.scrollbar.x = this.list._1X_Q_().width + _1Q_C_;
      }
      
      private function _0K_o() : void
      {
         this.scrollbar = new _T_n._11p();
         this.scrollbar._d2.add(this._K_e);
         this.scrollbar.visible = false;
         addChild(this.scrollbar);
      }
      
      private function _K_e(param1:Number) : void
      {
         var _loc2_:int = this.list._1L_J_().height - this.list._1X_Q_().height;
         this.list._1yq(_loc2_ * param1);
      }
   }
}
