package _1U_P_
{
   import flash.display.Sprite;
   import _05g._1S_m;
   import flash.display.DisplayObjectContainer;
   import _17B_._1dh;
   import _1cm._0y6;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui.Button;
   import _1S_0._1mh;
   import _00v._G_D_;
   import _1pp._8u;
   import _1xa._dU_;
   import flash.text.TextFieldAutoSize;
   import flash.display.BitmapData;
   import flash.events.MouseEvent;
   
   public class _eO_ extends Sprite
   {
      
      public static const WIDTH:int = 274;
      
      public static const HEIGHT:int = 338;
      
      public static const TITLE:String = "ArenaQueryPanel.title";
      
      public static const CLOSE:String = "Close.text";
      
      public static const _08t:String = "ArenaQueryDialog.info";
      
      public static const BACK:String = "Screens.back";
       
      
      private const _1g3:_1S_m = this._1ze();
      
      private const container:DisplayObjectContainer = this.makeContainer();
      
      private const background:_1dh = this._1L_c();
      
      private const host:_0y6 = this._0V_j();
      
      private const title:SimpleText = this._1lN_();
      
      private const _1d0:Button = this._1st();
      
      public const _1H___:_1mh = new _1mh(this._1d0,MouseEvent.CLICK);
      
      public function _eO_()
      {
         super();
      }
      
      private function _1ze() : _1S_m
      {
         var _loc1_:_1S_m = new _1S_m();
         _loc1_.complete.addOnce(this._R_k);
         return _loc1_;
      }
      
      private function _R_k() : void
      {
         var _loc1_:_G_D_ = new _G_D_();
         _loc1_.layout(WIDTH,this._1d0);
      }
      
      private function makeContainer() : DisplayObjectContainer
      {
         var _loc1_:Sprite = null;
         _loc1_ = new Sprite();
         _loc1_.x = (800 - WIDTH) / 2;
         _loc1_.y = (600 - HEIGHT) / 2;
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1L_c() : _1dh
      {
         var _loc1_:_1dh = new _1dh();
         _loc1_.draw(WIDTH,HEIGHT);
         _loc1_._0yq(_1dh.HORIZONTAL_DIVISION,34);
         this.container.addChild(_loc1_);
         return _loc1_;
      }
      
      private function _0V_j() : _0y6
      {
         var _loc1_:_0y6 = null;
         _loc1_ = new _0y6();
         _loc1_.x = 20;
         _loc1_.y = 50;
         this.container.addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1lN_() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = _8u._0M_n(16777215,18,true);
         _loc1_.setStringBuilder(new _dU_().setParams(TITLE));
         _loc1_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc1_.x = WIDTH / 2;
         _loc1_.y = 24;
         this.container.addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1st() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button(16,BACK,80);
         this.container.addChild(_loc1_);
         this._1g3.push(_loc1_.textChanged);
         _loc1_.y = 292;
         return _loc1_;
      }
      
      private function _C_r() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button(16,CLOSE,110);
         _loc1_.y = 292;
         this.container.addChild(_loc1_);
         this._1g3.push(_loc1_.textChanged);
         return _loc1_;
      }
      
      public function _W_Z_(param1:BitmapData) : void
      {
         this.host._W_Z_(param1);
      }
   }
}
