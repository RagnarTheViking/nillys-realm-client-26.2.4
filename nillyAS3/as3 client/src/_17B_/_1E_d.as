package _17B_
{
   import flash.display.Sprite;
   import _P_N_.CaretakerQueryDialog;
   import _00v._1yN_;
   import _00v._1cz;
   import flash.display.Shape;
   import _1gF_.SimpleText;
   import _f7.Signal;
   import flash.text.TextFieldAutoSize;
   import flash.events.MouseEvent;
   import _1xa._dU_;
   
   public class _1E_d extends Sprite
   {
      
      private static const WIDTH:int = CaretakerQueryDialog.WIDTH - 40;
      
      private static const HEIGHT:int = 40;
      
      private static const BEVEL:int = 2;
      
      private static const OUT:uint = 6052956;
      
      private static const _14w:uint = 8355711;
       
      
      private const _pi:_1yN_ = new _1yN_();
      
      private const rect:_1cz = new _1cz(WIDTH,HEIGHT,BEVEL);
      
      private const background:Shape = _1L_c();
      
      private const _16N_:SimpleText = _1Y_2();
      
      public const textChanged:Signal = _16N_.textChanged;
      
      public var info:String;
      
      public function _1E_d(param1:String, param2:String)
      {
         super();
         this.info = param2;
         this._16N_.setStringBuilder(new _dU_().setParams(param1));
         this._nZ_();
      }
      
      private function _1L_c() : Shape
      {
         var _loc1_:Shape = new Shape();
         this._1W_A_(_loc1_,OUT);
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1W_A_(param1:Shape, param2:uint) : void
      {
         param1.graphics.clear();
         param1.graphics.beginFill(param2);
         this._pi._18h(0,0,this.rect,param1.graphics);
         param1.graphics.endFill();
      }
      
      private function _1Y_2() : SimpleText
      {
         var _loc1_:SimpleText = new SimpleText().setSize(16).setColor(16777215).setBold(true).setAutoSize(TextFieldAutoSize.CENTER).setVerticalAlign(SimpleText.MIDDLE).setPosition(WIDTH / 2,HEIGHT / 2);
         _loc1_.mouseEnabled = false;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _nZ_() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._1W_A_(this.background,_14w);
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._1W_A_(this.background,OUT);
      }
   }
}
