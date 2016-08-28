package Market
{
   import flash.display.Sprite;
   import _05g._1S_m;
   import flash.display.DisplayObjectContainer;
   import _17B_._1dh;
   import _1gF_.SimpleText;
   import _17B_._W_c;
   import com.company.assembleegameclient.ui.Button;
   import _f7.Signal;
   import _00v._G_D_;
   import _0xn._1uk;
   import _1xa.SText;
   import flash.text.TextFieldAutoSize;
   import flash.events.MouseEvent;
   import flash.display.BitmapData;
   import _1S_0.NativeMappedSignal;
   
   public class InfoDialog extends Sprite
   {
      
      public static const WIDTH:int = 274;
      
      public static const HEIGHT:int = 428;
      
      public static const TITLE:String = "Market Info";
      
      public static const CLOSE:String = "Close";
      
      public static const BACK:String = "Back";
      
      public static const Questions:Array = [{
         "category":"marketInfo.about",
         "info":"marketInfo.about.desc"
      },{
         "category":"marketInfo.selling",
         "info":"marketInfo.selling.desc"
      },{
         "category":"marketInfo.buying",
         "info":"marketInfo.buying.desc"
      },{
         "category":"marketInfo.forgot",
         "info":"marketInfo.forgot.desc"
      },{
         "category":"marketInfo.undo",
         "info":"marketInfo.undo.desc"
      },{
         "category":"marketInfo.gimmeBack",
         "info":"marketInfo.gimmeBack.desc"
      }];
       
      
      private const _1g3:_1S_m = _1ze();
      
      private const container:DisplayObjectContainer = makeContainer();
      
      private const background:_1dh = _1L_c();
      
      private const query:Market.InfoDialogQuery = _qy();
      
      private const title:SimpleText = _1lN_();
      
      private const _16P_:_W_c = _0i9();
      
      private const BackBtn:Button = CreateBackButton();

      private const CloseBtn:Button = CreateCloseButton();
      
      public const closed:Signal = new NativeMappedSignal(CloseBtn,MouseEvent.CLICK);
      
      public function InfoDialog()
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
         _loc1_.layout(WIDTH,this.CloseBtn);
         _loc1_.layout(WIDTH,this.BackBtn);
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
      
      private function _qy() : Market.InfoDialogQuery
      {
         var _loc1_:Market.InfoDialogQuery = null;
         _loc1_ = new Market.InfoDialogQuery();
         _loc1_.x = 20;
         _loc1_.y = 50;
         this.container.addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1lN_() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = _1uk._0M_n(16777215,18,true);
         _loc1_.setStringBuilder(new SText(TITLE));
         _loc1_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc1_.x = WIDTH / 2;
         _loc1_.y = 24;
         this.container.addChild(_loc1_);
         return _loc1_;
      }
      
      private function CreateBackButton() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button(16,BACK,80,true);
         _loc1_.y = 382;
         _loc1_.visible = false;
         _loc1_.addEventListener(MouseEvent.CLICK,this.BackEvent);
         this.container.addChild(_loc1_);
         this._1g3.push(_loc1_.textChanged);
         return _loc1_;
      }
      
      private function BackEvent(param1:MouseEvent) : void
      {
         this.query._14E_();
         this._16P_.visible = true;
         this.CloseBtn.visible = true;
         this.BackBtn.visible = false;
      }
      
      private function CreateCloseButton() : Button
      {
         var _loc1_:Button = null;
         _loc1_ = new Button(16,CLOSE,110,true);
         _loc1_.y = 382;
         this.container.addChild(_loc1_);
         this._1g3.push(_loc1_.textChanged);
         return _loc1_;
      }
      
      private function _0i9() : _W_c
      {
         var _loc1_:_W_c = null;
         _loc1_ = new _W_c(Questions);
         _loc1_.x = 20;
         _loc1_.y = 110;
         _loc1_.selected.add(this._X_Y_);
         this.container.addChild(_loc1_);
         this._1g3.push(_loc1_.ready);
         return _loc1_;
      }
      
      private function _X_Y_(param1:String) : void
      {
         this._16P_.visible = false;
         this.CloseBtn.visible = false;
         this.BackBtn.visible = true;
         this.query._070(param1);
      }
      
      public function _0K_L_(param1:BitmapData) : void
      {
         this.query._0K_L_(param1);
      }
   }
}
