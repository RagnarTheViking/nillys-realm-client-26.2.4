package _06
{
   import flash.display.Sprite;
   import _4g._0zQ_;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class _0T_n extends Sprite implements _0zQ_
   {
      
      public static var _0L_W_:Class = _1w;
       
      
      private var _07d:Sprite;
      
      public function _0T_n()
      {
         super();
         this._0N_c();
         this._C_r();
      }
      
      private function _0N_c() : void
      {
         addChild(new _0L_W_());
      }
      
      private function _C_r() : void
      {
         this._07d = new Sprite();
         this._07d.graphics.beginFill(16711680,0);
         this._07d.graphics.drawRect(0,0,30,30);
         this._07d.graphics.endFill();
         this._07d.buttonMode = true;
         this._07d.x = 550;
         this._07d.y = 30;
         addEventListener(MouseEvent.CLICK,this._fH_);
         addChild(this._07d);
      }
      
      private function _fH_(param1:MouseEvent) : void
      {
         parent.removeChild(this);
      }
      
      public function resize(param1:Rectangle) : void
      {
         x = (param1.width - width) / 2;
         y = (param1.height - height) / 2;
      }
   }
}
