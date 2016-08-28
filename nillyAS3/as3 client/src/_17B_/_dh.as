package _17B_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import flash.display.Shape;
   import _T_J_.GTween;
   import flash.geom.ColorTransform;
   
   public class _dh extends Sprite
   {
       
      
      public const _I_B_:Signal = new Signal(Boolean);
      
      public const _zC_:Signal = new Signal();
      
      private const _ep:uint = 11776947;
      
      private const _1T_V_:uint = 1572859;
      
      private const _1nF_:uint = 5658198;
      
      private var _A_l:Shape;
      
      private var _0kO_:Shape;
      
      private var _0B_6:int = 0;
      
      public var _1W_R_:int = -1;
      
      private var _0g6:int = 0;
      
      private var _0w8:int = 0;
      
      public function _dh(param1:int, param2:int)
      {
         this._A_l = new Shape();
         this._0kO_ = new Shape();
         super();
         this._0g6 = param1;
         this._0w8 = param2;
         this._0kO_.graphics.beginFill(this._1nF_,1);
         this._0kO_.graphics.drawRect(0,0,param1,param2);
         addChild(this._0kO_);
         addChild(this._A_l);
      }
      
      public function reset() : void
      {
         this._1W_R_ = 0;
         this._A_l.graphics.clear();
         this._A_l.graphics.beginFill(this._ep,1);
         this._A_l.graphics.drawRect(0,0,1,this._0w8);
         this._A_l.width = 1;
      }
      
      public function fill() : void
      {
         if(this._1W_R_ == this._0B_6)
         {
            this.reset();
            this._zC_.dispatch();
            return;
         }
         var _loc1_:Number = this._0g6;
         this._P_n(this._1T_V_);
         var _loc2_:GTween = new GTween(this._A_l,1,{"width":_loc1_});
         _loc2_.onComplete = this._J_g;
      }
      
      private function _J_g(param1:GTween) : void
      {
         this._zC_.dispatch();
      }
      
      public function _P_n(param1:uint) : void
      {
         var _loc2_:ColorTransform = this._A_l.transform.colorTransform;
         _loc2_.color = param1;
         this._A_l.transform.colorTransform = _loc2_;
      }
      
      public function _1X_z(param1:int) : void
      {
         this._0B_6 = param1;
         this._1L_S_();
      }
      
      public function _0W_I_(param1:int) : void
      {
         var _loc2_:Number = NaN;
         if(this._1W_R_ == -1)
         {
            this._1W_R_ = param1;
            _loc2_ = this._1tb();
            this._A_l.graphics.beginFill(this._ep,1);
            this._A_l.graphics.drawRect(0,0,_loc2_,this._0w8);
         }
         this._1W_R_ = param1;
         this._1L_S_();
      }
      
      private function _1L_S_() : void
      {
         var _loc1_:GTween = null;
         var _loc2_:int = this._1tb();
         if(this._1W_R_ != -1 && this._1W_R_ != 0 && _loc2_ != Math.round(this._A_l.width))
         {
            this._I_B_.dispatch(true);
            this._P_n(this._1T_V_);
            _loc1_ = new GTween(this._A_l,2,{"width":_loc2_});
            _loc1_.onComplete = this._1P_3;
         }
      }
      
      private function _1tb() : int
      {
         var _loc1_:int = this._1W_R_ * this._0g6 / this._0B_6;
         return !!isNaN(_loc1_)?1:int(Math.round(Math.max(1,Math.min(this._0g6,_loc1_))));
      }
      
      public function _1P_3(param1:GTween) : void
      {
         this._P_n(this._ep);
         this._I_B_.dispatch(false);
      }
   }
}
