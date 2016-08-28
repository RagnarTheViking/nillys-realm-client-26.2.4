package _P_N_
{
   import flash.display.Sprite;
   import _05g._1S_m;
   import flash.display.DisplayObjectContainer;
   import _17B_._1dh;
   import _17B_._1uS_;
   import _1gF_.SimpleText;
   import _17B_._W_c;
   import com.company.assembleegameclient.ui.Button;
   import _f7.Signal;
   import _00v._G_D_;
   import _0xn._1uk;
   import _1xa._dU_;
   import flash.text.TextFieldAutoSize;
   import flash.events.MouseEvent;
   import flash.display.BitmapData;
   import _1S_0.NativeMappedSignal;
   
   public class CaretakerQueryDialog extends Sprite
   {
      
      public static const WIDTH:int = 274;
      
      public static const HEIGHT:int = 428;
      
      public static const TITLE:String = "CaretakerQueryDialog.title";
      
      public static const _08t:String = "CaretakerQueryDialog.query";
      
      public static const CLOSE:String = "Close.text";
      
      public static const BACK:String = "Screens.back";
      
      public static const _1lb:Array = [{
         "category":"CaretakerQueryDialog.category_petYard",
         "info":"CaretakerQueryDialog.info_petYard"
      },{
         "category":"CaretakerQueryDialog.category_pets",
         "info":"CaretakerQueryDialog.info_pets"
      },{
         "category":"CaretakerQueryDialog.category_abilities",
         "info":"CaretakerQueryDialog.info_abilities"
      },{
         "category":"CaretakerQueryDialog.category_feedingPets",
         "info":"CaretakerQueryDialog.info_feedingPets"
      },{
         "category":"CaretakerQueryDialog.category_fusingPets",
         "info":"CaretakerQueryDialog.info_fusingPets"
      },{
         "category":"CaretakerQueryDialog.category_evolution",
         "info":"CaretakerQueryDialog.info_evolution"
      }];
       
      
      private const _1g3:_1S_m = _1ze();
      
      private const container:DisplayObjectContainer = makeContainer();
      
      private const background:_1dh = _1L_c();
      
      private const caretaker:_1uS_ = _qy();
      
      private const title:SimpleText = _1lN_();
      
      private const _16P_:_W_c = _0i9();
      
      private const _1d0:Button = _1st();
      
      private const _1D_r:Button = _C_r();
      
      public const closed:Signal = new NativeMappedSignal(_1D_r,MouseEvent.CLICK);
      
      public function CaretakerQueryDialog()
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
         _loc1_.layout(WIDTH,this._1D_r);
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
      
      private function _qy() : _1uS_
      {
         var _loc1_:_1uS_ = null;
         _loc1_ = new _1uS_();
         _loc1_.x = 20;
         _loc1_.y = 50;
         this.container.addChild(_loc1_);
         return _loc1_;
      }
      
      private function _1lN_() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = _1uk._0M_n(16777215,18,true);
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
         _loc1_.y = 382;
         _loc1_.visible = false;
         _loc1_.addEventListener(MouseEvent.CLICK,this._1O_U_);
         this.container.addChild(_loc1_);
         this._1g3.push(_loc1_.textChanged);
         return _loc1_;
      }
      
      private function _1O_U_(param1:MouseEvent) : void
      {
         this.caretaker._14E_();
         this._16P_.visible = true;
         this._1D_r.visible = true;
         this._1d0.visible = false;
      }
      
      private function _C_r() : Button
      {
         var _loc1_:Button = new Button(16,CLOSE,110);
         _loc1_.y = 382;
         this.container.addChild(_loc1_);
         this._1g3.push(_loc1_.textChanged);
         return _loc1_;
      }
      
      private function _0i9() : _W_c
      {
         var _loc1_:_W_c = null;
         _loc1_ = new _W_c(_1lb);
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
         this._1D_r.visible = false;
         this._1d0.visible = true;
         this.caretaker._070(param1);
      }
      
      public function _0K_L_(param1:BitmapData) : void
      {
         this.caretaker._0K_L_(param1);
      }
   }
}
