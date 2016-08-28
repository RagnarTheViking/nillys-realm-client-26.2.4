package _W_Q_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import com.company.rotmg.graphics.StackedLogoR;
   import com.company.rotmg.graphics.KabamLogo;
   import flash.text.TextFieldAutoSize;
   import flash.events.MouseEvent;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import _0qE_._1gw;
   import flash.events.Event;
   import flash.net.navigateToURL;
   import flash.net.URLRequest;
   import _ju._0O_M_;
   import com.company.rotmg.graphics.ScreenGraphic;
   
   public class _F_g extends Sprite
   {
      
      private static const _bR_:String = "http://www.wildshadow.com/";
      
      private static const _jp:String = "http://www.kabam.com/";
       
      
      public var close:Signal;
      
      private var _18a:SimpleText;
      
      private var _0xj:StackedLogoR;
      
      private var _1__u:KabamLogo;
      
      private var _1D_r:_W_Q_.TextButton;
      
      public function _F_g()
      {
         this._18a = this._1C_O_();
         this._0xj = this._E_w();
         this._1__u = this._lS_();
         this._1D_r = this._C_r();
         super();
         this.close = new Signal();
         addChild(new _0O_M_());
         addChild(new ScreenGraphic());
         addChild(this._18a);
         addChild(this._0xj);
         addChild(this._1__u);
         addChild(this._1D_r);
      }
      
      private function _C_r() : _W_Q_.TextButton
      {
         this._1D_r = new _W_Q_.TextButton("Close.text",36,false);
         this._1D_r.setAutoSize(TextFieldAutoSize.CENTER);
         this._1D_r.addEventListener(MouseEvent.CLICK,this._0Q_a);
         return this._1D_r;
      }
      
      private function _lS_() : KabamLogo
      {
         this._1__u = new KabamLogo();
         this._1__u.scaleX = this._1__u.scaleY = 1;
         this._1__u.addEventListener(MouseEvent.CLICK,this._1in);
         this._1__u.buttonMode = true;
         this._1__u.useHandCursor = true;
         return this._1__u;
      }
      
      private function _E_w() : StackedLogoR
      {
         this._0xj = new StackedLogoR();
         this._0xj.scaleX = this._0xj.scaleY = 1.2;
         this._0xj.addEventListener(MouseEvent.CLICK,this._F_G_);
         this._0xj.buttonMode = true;
         this._0xj.useHandCursor = true;
         return this._0xj;
      }
      
      private function _1C_O_() : SimpleText
      {
         this._18a = new SimpleText();
         this._18a.setColor(11776947).setSize(16).setBold(true);
         this._18a.setStringBuilder(new _dU_().setParams(_1O_I_._1O_O_));
         this._18a.filters = [new DropShadowFilter(0,0,0)];
         this._18a.setAutoSize(TextFieldAutoSize.CENTER);
         return this._18a;
      }
      
      public function initialize() : void
      {
         stage;
         this._18a.x = 800 / 2;
         this._18a.y = 10;
         stage;
         this._0xj.x = 800 / 2 - this._0xj.width / 2;
         this._0xj.y = 50;
         stage;
         this._1__u.x = 800 / 2 - this._1__u.width / 2;
         this._1__u.y = 325;
         stage;
         this._1D_r.x = 800 / 2 - this._1D_r.width / 2;
         this._1D_r.y = _1gw._0Z_h;
      }
      
      protected function _F_G_(param1:Event) : void
      {
         navigateToURL(new URLRequest(_bR_),"_blank");
      }
      
      protected function _1in(param1:Event) : void
      {
         navigateToURL(new URLRequest(_jp),"_blank");
      }
      
      private function _0Q_a(param1:Event) : void
      {
         this.close.dispatch();
      }
   }
}
