package _R_o
{
   import flash.display.Sprite;
   import _4g._0zQ_;
   import flash.text.TextField;
   import _2F_.Console;
   import _1cV_._g9;
   import flash.geom.Rectangle;
   import flash.display.BlendMode;
   import flash.text.TextFormat;
   import flash.text.TextFieldAutoSize;
   import _2F_._0__X_;
   
   public final class _01Y_ extends Sprite implements _0zQ_
   {
      
      private static const _0U_o:String = "kabam.lib/console";
       
      
      private const _S_P_:RegExp = /\[0x(.+)\:(.+)\]/ig;
      
      private const _5A_:String = "<font color=\'#$1\'>$2</font>";
      
      private const _X_Z_:Array = [];
      
      private const _00R_:Array = [];
      
      private const _1M_b:Object = {};
      
      private var _0uV_:TextField;
      
      private var _D_V_:Console;
      
      private var _1tX_:Number;
      
      public function _01Y_()
      {
         this._0uV_ = new TextField();
         super();
         alpha = 0.8;
         blendMode = BlendMode.LAYER;
         addChild(this._0uV_);
         this._0uV_.alpha = 0.6;
         this._0uV_.defaultTextFormat = new TextFormat("_sans",14,16777215,true);
         this._0uV_.htmlText = _0U_o;
         this._0uV_.selectable = false;
         this._0uV_.multiline = true;
         this._0uV_.wordWrap = true;
         this._0uV_.autoSize = TextFieldAutoSize.LEFT;
         this._0uV_.background = true;
         this._0uV_.border = false;
         this._0uV_.backgroundColor = 13056;
         this._D_V_ = new Console("",new _0__X_());
         addChild(this._D_V_);
      }
      
      public function _M_b(param1:_g9) : void
      {
         var _loc2_:_g9 = this._1M_b[param1.name] = this._1M_b[param1.name] || this._198(param1.name);
         _loc2_.data = param1.data.replace(this._S_P_,this._5A_);
         this._0lP_();
      }
      
      public function _0S_N_(param1:String) : void
      {
         var _loc2_:_g9 = this._1M_b[param1];
         if(_loc2_)
         {
            delete this._1M_b[param1];
            this._00R_.splice(this._00R_.indexOf(_loc2_),1);
         }
      }
      
      private function _198(param1:String) : _g9
      {
         var _loc2_:_g9 = new _g9(param1);
         this._00R_.push(_loc2_);
         return _loc2_;
      }
      
      public function log(param1:String) : void
      {
         var _loc2_:String = param1.replace(this._S_P_,this._5A_);
         this._X_Z_.push(_loc2_);
         this._D_V_._0B_0(_loc2_);
      }
      
      public function clear() : void
      {
         var _loc1_:* = null;
         this._X_Z_.length = 0;
         this._00R_.length = 0;
         for(_loc1_ in this._1M_b)
         {
            delete this._1M_b[_loc1_];
         }
      }
      
      public function resize(param1:Rectangle) : void
      {
         this._1tX_ = param1.height - _0J_y.HEIGHT;
         x = param1.x;
         y = param1.y;
         this._0uV_.width = param1.width;
         this._D_V_.width = param1.width;
         this._pr();
      }
      
      private function _pr() : void
      {
         this._0uV_.y = this._1tX_ - this._0uV_.height;
      }
      
      private function _0lP_() : void
      {
         this._0uV_.htmlText = this._00R_.join("\n");
         this._pr();
      }
      
      public function _1g8() : String
      {
         return this._X_Z_.join("\r");
      }
   }
}
