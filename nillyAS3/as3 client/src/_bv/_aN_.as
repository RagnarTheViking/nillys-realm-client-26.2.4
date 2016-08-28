package _bv
{
   import flash.display.Sprite;
   import flash.display.Shape;
   import _1gF_.SimpleText;
   import _1C_p._16E_;
   import flash.display.Loader;
   import _f7.Signal;
   import _wi.Injector;
   import flash.events.MouseEvent;
   import _1gF_._0M_X_;
   import flash.text.TextFieldAutoSize;
   import _1xa.SText;
   import flash.filters.DropShadowFilter;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import _0H_6.GameContext;
   
   public class _aN_ extends Sprite
   {
      
      private static const _0Q___:uint = 30;
      
      private static const LARGE:String = "LARGE";
      
      private static const SMALL:String = "SMALL";
      
      static var _0C_e:Class = _05u;
      
      static var _0yv:Class = _03p;
       
      
      private var _0dF_:Sprite;
      
      private var _1V_i:Shape;
      
      private var _L_:Shape;
      
      private var textField:SimpleText;
      
      private var size:String;
      
      private var w:Number;
      
      private var h:Number;
      
      private var _1aU_:_16E_;
      
      private var _loader:Loader;
      
      private var _uw:uint = 18;
      
      public var _0c__:Signal;
      
      private var _T_X_:Injector;
      
      public function _aN_(param1:Number, param2:Number)
      {
         this._0c__ = new Signal(_16E_);
         super();
         this._T_X_ = GameContext.getInjector();
         this.setSize(param1,param2);
         this._1F_w();
         this._E_p();
         this._0Y_6();
      }
      
      private function setSize(param1:Number, param2:Number) : void
      {
         this.w = param1;
         this.h = param2;
         if(param1 == 306 && param2 == 194)
         {
            this.size = LARGE;
         }
         else if(param1 == 151 && param2 == 189)
         {
            this.size = SMALL;
         }
      }
      
      public function init(param1:_16E_) : void
      {
         this._1aU_ = param1;
         this._0ht();
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         buttonMode = true;
      }
      
      private function _1P_V_() : void
      {
         addChild(this._1V_i = new Shape());
         addChild(this._L_ = new Shape());
      }
      
      private function _1F_w() : void
      {
         this._0dF_ = new Sprite();
         addChild(this._0dF_);
      }
      
      private function _E_p() : void
      {
         this._1V_i = new Shape();
         this._1V_i.graphics.beginFill(16711935);
         this._1V_i.graphics.drawRect(0,0,this.w,this.h);
         this._0dF_.mask = this._1V_i;
         addChild(this._1V_i);
      }
      
      private function _0Y_6() : void
      {
         this._L_ = new Shape();
         this._L_.graphics.beginFill(0,0.8);
         this._L_.graphics.drawRect(0,this.h - _0Q___,this.w,_0Q___);
         addChild(this._L_);
      }
      
      private function _0ht() : void
      {
         this.textField = this._T_X_.getInstance(_0M_X_).setSize(this._uw).setColor(16777215);
         addChild(this.textField);
         this.textField.setBold(true).setAutoSize(TextFieldAutoSize.CENTER).setVerticalAlign(SimpleText.MIDDLE);
         this.textField.setStringBuilder(new SText(this._1aU_._H_b));
         this._12s();
         this.textField.x = this.w / 2;
         this.textField.y = this.h - 25 / 2;
         this.textField.filters = [new DropShadowFilter(0,0,0)];
      }
      
      private function _12s() : void
      {
         if(this.textField.width > this.w - 10)
         {
            this._uw = this._uw - 2;
            this.textField.setSize(this._uw).setColor(16777215);
            this._12s();
         }
      }
      
      public function load() : void
      {
         this._loader = new Loader();
         this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onComplete);
         this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
         this._loader.load(new URLRequest(this._1aU_._1F_I_));
      }
      
      private function onComplete(param1:Event) : void
      {
         this._0dF_.addChild(this._loader);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         switch(this.size)
         {
            case LARGE:
               this._0dF_.addChild(new _0C_e());
               return;
            case SMALL:
               this._0dF_.addChild(new _0yv());
               return;
            default:
               return;
         }
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this._0c__.dispatch(this._1aU_);
      }
   }
}
