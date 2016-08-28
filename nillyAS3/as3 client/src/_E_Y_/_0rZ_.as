package _E_Y_
{
   import flash.display.Sprite;
   import _1un._N_9;
   import _1un.Layout;
   import _1un.Size;
   import _f7.Signal;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.geom.Rectangle;
   import flash.display.Graphics;
   
   public class _0rZ_ extends Sprite implements _N_9
   {
      
      private static const _1tJ_:Layout = new _1L_Y_();
      
      private static const _1d4:Size = new Size(0,0);
       
      
      public const _J_v:Signal = new Signal();
      
      private const list:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
      
      private const container:Sprite = new Sprite();
      
      private const _K_f:Shape = new Shape();
      
      private var layout:Layout;
      
      private var size:Size;
      
      private var offset:int = 0;
      
      public function _0rZ_()
      {
         this.layout = _1tJ_;
         this.size = _1d4;
         super();
         addChild(this.container);
         addChild(this._K_f);
      }
      
      public function _g2() : Layout
      {
         return this.layout;
      }
      
      public function _Z_a(param1:Layout) : void
      {
         this.layout = param1 || _1tJ_;
         param1.layout(this.list,-this.offset);
      }
      
      public function _1X_Q_() : Size
      {
         return this.size;
      }
      
      public function setSize(param1:Size) : void
      {
         this.size = param1 || _1d4;
         this._1I_l();
      }
      
      public function _1L_J_() : Size
      {
         var _loc1_:Rectangle = this.container.getRect(this.container);
         return new Size(_loc1_.width,_loc1_.height);
      }
      
      private function _1I_l() : void
      {
         var _loc1_:Graphics = this._K_f.graphics;
         _loc1_.clear();
         _loc1_.beginFill(10027263);
         _loc1_.drawRect(0,0,this.size.width,this.size.height);
         _loc1_.endFill();
         this.container.mask = this._K_f;
      }
      
      public function addItem(param1:DisplayObject) : void
      {
         this._0ly(param1);
         this._1A_s();
         this._J_v.dispatch();
      }
      
      public function _hD_(param1:int) : DisplayObject
      {
         return this.list[param1];
      }
      
      public function setItems(param1:Vector.<DisplayObject>) : void
      {
         this._1T_3();
         this._1D_f(param1);
         this.offset = 0;
         this._1A_s();
         this._J_v.dispatch();
      }
      
      public function _0M_t() : int
      {
         return this.list.length;
      }
      
      private function _1T_3() : void
      {
         var _loc1_:int = this.list.length;
         while(_loc1_--)
         {
            this.container.removeChild(this.list[_loc1_]);
         }
         this.list.length = 0;
      }
      
      private function _1D_f(param1:Vector.<DisplayObject>) : void
      {
         var _loc2_:DisplayObject = null;
         for each(_loc2_ in param1)
         {
            this._0ly(_loc2_);
         }
      }
      
      private function _0ly(param1:DisplayObject) : void
      {
         this.list.push(param1);
         this.container.addChild(param1);
      }
      
      public function _1yq(param1:int) : void
      {
         this.offset = param1;
         this._1A_s();
      }
      
      public function _1W_Z_() : int
      {
         return this.offset;
      }
      
      public function _1A_s() : void
      {
         this.layout.layout(this.list,-this.offset);
      }
   }
}
