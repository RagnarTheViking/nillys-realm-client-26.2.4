package _0C_j
{
   import flash.display.Sprite;
   import _4g._0zQ_;
   import flash.display.DisplayObject;
   import _1gF_.SimpleText;
   import _f7.Signal;
   import _0Q_5.URLAssetBase;
   import _166.Package;
   import flash.geom.Rectangle;
   import _17B_.XImageButton;
   import com.company.assembleegameclient.ui.Button;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import flash.events.MouseEvent;
   import flash.events.IOErrorEvent;
   import flash.events.Event;
   import flash.net.URLRequest;
   import _1xa.SText;
   import _0Q_5.URLAsset;
   
   public class PackageOfferDialog extends Sprite implements _0zQ_
   {
       
      
      const _0X_6:Number = 6;
      
      const _E_D_:Number = 6;
      
      const _C_e:Number = 16;
      
      const fontSize:int = 27;
      
      private const _0A_N_:DisplayObject = this._1N_();
      
      private const buyNow:Sprite = this._0U_z();
      
      private const title:SimpleText = this._1lN_();
      
      private const _1D_r:Sprite = this._C_r();
      
      public var ready:Signal;
      
      public var buy:Signal;
      
      public var close:Signal;
      
      var loader:URLAssetBase;
      
      var cost:Cost;
      
      var image:DisplayObject;
      
      private var pkg:Package;
      
      private var _0w3:Rectangle;
      
      public function PackageOfferDialog()
      {
         this.ready = new Signal();
         this.buy = new Signal();
         this.close = new Signal();
         this.loader = new URLAsset();
         this.cost = new Cost();
         this._0w3 = new Rectangle();
         super();
      }
      
      private function _1N_() : DisplayObject
      {
         var _loc1_:DisplayObject = new _1sU_();
         addChild(_loc1_);
         return _loc1_;
      }
      
      private function _C_r() : Sprite
      {
         return new XImageButton();
      }
      
      private function _0U_z() : Button
      {
         return new Button(16,_1O_I_._0vg);
      }
      
      private function _1lN_() : SimpleText
      {
         var _loc1_:SimpleText = null;
         _loc1_ = new SimpleText().setSize(this.fontSize).setColor(11776947);
         _loc1_.y = this._0X_6 + 5;
         _loc1_.setAutoSize(TextFieldAutoSize.CENTER);
         return _loc1_;
      }
      
      public function setPackage(param1:Package) : PackageOfferDialog
      {
         removeChild(this._0A_N_);
         this.pkg = param1;
         this._1I_o(this.pkg.bgURL);
         return this;
      }
      
      public function _0aT_() : Package
      {
         return this.pkg;
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this._1D_r.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.close.dispatch();
      }
      
      private function _1I_o(param1:String) : void
      {
         this.loader && this.loader.unload();
         this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onComplete);
         this.loader.load(new URLRequest(param1));
      }
      
      public function destroy() : void
      {
         this.loader.unload();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         this._1Y_u();
         this._0zw(new _11Z_());
         this.ready.dispatch();
      }
      
      private function onComplete(param1:Event) : void
      {
         this._1Y_u();
         this._0zw(this.loader);
         this.ready.dispatch();
      }
      
      private function _0zw(param1:DisplayObject) : void
      {
         this.setImage(param1);
         addChild(this.title);
         this._1cF_();
         this._zi();
         this._W_A_();
         this.setTitle(this.pkg.name);
         this._5u(this.pkg.price);
      }
      
      private function _1Y_u() : void
      {
         this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onComplete);
      }
      
      private function _W_A_() : void
      {
         this.cost.init(this.pkg.curType);
         addChild(this.cost);
         this.cost.x = this.buyNow.x - 16;
         this.cost.y = this.buyNow.y + this.buyNow.height / 2;
      }
      
      private function _zi() : void
      {
         addChild(this.buyNow);
         this.buyNow.x = this.image.width / 2 - this.buyNow.width / 2;
         this.buyNow.y = this.image.height - this.buyNow.height - this._C_e - 4;
         this.buyNow.addEventListener(MouseEvent.MOUSE_UP,this._17Y_);
      }
      
      private function _17Y_(param1:Event) : void
      {
         this.buyNow.removeEventListener(MouseEvent.MOUSE_UP,this._17Y_);
         this.buy.dispatch();
      }
      
      private function _1cF_() : void
      {
         addChild(this._1D_r);
         this._1D_r.x = this.image.width - this._1D_r.width * 2 - this._E_D_;
         this._1D_r.y = this._0X_6 + 5;
         this._1D_r.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      private function setImage(param1:DisplayObject) : void
      {
         this.image && removeChild(this.image);
         this.image = param1;
         this.image && addChild(this.image);
         this.center();
      }
      
      private function center() : void
      {
         x = (this._0w3.width - width) / 2;
         y = (this._0w3.height - height) / 2;
      }
      
      private function setTitle(param1:String) : void
      {
         this.title.setStringBuilder(new SText(param1));
         this.title.x = this.image.width / 2;
      }
      
      private function _5u(param1:int) : void
      {
         this.cost._5u(param1);
      }
      
      public function resize(param1:Rectangle) : void
      {
         this._0w3 = param1;
         this.center();
      }
   }
}
