package _0Z_1
{
   import _f7.Signal;
   import com.company.assembleegameclient.objects.ArenaPortal;
   import flash.display.Sprite;
   import _1gF_._I_a;
   import _T_n._1gJ_;
   import _1gF_.SimpleText;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.util.Currency;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import com.company.assembleegameclient.objects.Player;
   
   public class ArenaPortalPanel extends Panel
   {
       
      
      public const _0__:Signal = new Signal(int);
      
      private var _1od:ArenaPortal;
      
      private var _1tt:Sprite;
      
      private var nameText_:_I_a;
      
      private var _kv:_1gJ_;
      
      private var _08f:_1gJ_;
      
      private var _17G_:Sprite;
      
      private var _18z:SimpleText;
      
      private var _49:_I_a;
      
      public function ArenaPortalPanel(param1:GameSpriteBase, param2:ArenaPortal)
      {
         this._1tt = new Sprite();
         this._17G_ = new Sprite();
         super(param1);
         this._1od = param2;
         addChild(this._1tt);
         addChild(this._17G_);
         if(gs_.map == null || gs_.map.player_ == null)
         {
            return;
         }
         var _loc3_:Player = gs_.map.player_;
         this.nameText_ = this._1lN_();
         this._1tt.addChild(this.nameText_);
         this._kv = new _1gJ_("",20,50,Currency.GOLD);
         this._kv.addEventListener(MouseEvent.CLICK,this._0W_M_);
         this._1tt.addChild(this._kv);
         this._08f = new _1gJ_("",20,500,Currency.FAME);
         if(_loc3_.currentFame_ < 500)
         {
            this._08f.setEnabled(false);
         }
         else
         {
            this._08f.addEventListener(MouseEvent.CLICK,this._wC_);
         }
         this._1tt.addChild(this._08f);
         this._08f._0T_g.addOnce(this.alignUI);
         this._49 = new _I_a();
         this._49.setSize(18).setColor(16711680).setTextWidth(WIDTH).setWordWrap(true).setMultiLine(true).setAutoSize(TextFieldAutoSize.CENTER).setBold(true).setHTML(true);
         this._49.setStringBuilder(new _dU_().setParams(_1O_I_._0ae).setPrefix("<p align=\"center\">").setPostfix("</p>"));
         this._49.filters = [new DropShadowFilter(0,0,0)];
         this._49.y = HEIGHT - 45;
         this._17G_.addChild(this._49);
         this._18z = this._1lN_();
         this._17G_.addChild(this._18z);
      }
      
      private function alignUI() : void
      {
         this._kv.x = WIDTH * 0.25 - this._kv.width / 2;
         this._kv.y = HEIGHT - this._kv.height - 4;
         this._08f.x = WIDTH * 0.75 - this._08f.width / 2;
         this._08f.y = HEIGHT - this._08f.height - 4;
      }
      
      private function _0W_M_(param1:MouseEvent) : void
      {
         this._0__.dispatch(Currency.GOLD);
      }
      
      private function _wC_(param1:MouseEvent) : void
      {
         this._0__.dispatch(Currency.FAME);
      }
      
      override public function draw() : void
      {
         this._1tt.visible = this._1od.usable_;
         this._17G_.visible = !this._1od.usable_;
      }
      
      private function _1lN_() : _I_a
      {
         var _loc1_:_I_a = null;
         _loc1_ = new _I_a();
         _loc1_.setSize(18).setColor(16777215).setTextWidth(WIDTH).setWordWrap(true).setMultiLine(true).setAutoSize(TextFieldAutoSize.CENTER).setBold(true).setHTML(true);
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._E_l).setPrefix("<p align=\"center\">").setPostfix("</p>"));
         _loc1_.filters = [new DropShadowFilter(0,0,0)];
         _loc1_.y = 6;
         return _loc1_;
      }
   }
}
