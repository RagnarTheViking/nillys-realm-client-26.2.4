package _1U_P_
{
   import flash.display.Sprite;
   import _f7.Signal;
   import _1gF_._I_a;
   import flash.display.Bitmap;
   import _W_Q_.TextButton;
   import _1cm._0e5;
   import flash.events.MouseEvent;
   import _04h._083;
   import _04h._11o;
   import _05g._1S_m;
   import _04h._160;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.TextureLibrary;
   import flash.display.BitmapData;
   import com.company.util.BitmapUtil;
   import flash.filters.DropShadowFilter;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import _1gF_.SimpleText;
   import flash.display.Shape;
   import flash.display.Graphics;
   import com.company.rotmg.graphics.ScreenGraphic;
   
   public class ArenaLeaderboard extends Sprite
   {
       
      
      public const _1mn:Signal = new Signal(_11o);
      
      public const close:Signal = new Signal();
      
      private var list:_1U_P_._0K_6;
      
      private var title:_I_a;
      
      private var _0bu:Bitmap;
      
      private var _1mN_:Bitmap;
      
      private var _0L_B_:Vector.<_1U_P_._G_>;
      
      private var selected:_1U_P_._G_;
      
      private var _1D_r:TextButton;
      
      private var _e4:_0e5;
      
      public function ArenaLeaderboard()
      {
         this.list = this._10d();
         this.title = this._1lN_();
         this._0bu = this._iV_(false);
         this._1mN_ = this._iV_(true);
         this._0L_B_ = this._kw();
         this._e4 = this._1M_H_();
         super();
         addChild(this.list);
         addChild(new ScreenGraphic());
         addChild(this._0bu);
         addChild(this._1mN_);
         addChild(this.title);
         this._C_r();
         this._0t2();
         addChild(this._e4);
      }
      
      public function init() : void
      {
         var _loc1_:_1U_P_._G_ = this._0L_B_[0];
         this.selected = _loc1_;
         _loc1_.setSelected(true);
         _loc1_.selected.dispatch(_loc1_);
      }
      
      public function destroy() : void
      {
         var _loc1_:_1U_P_._G_ = null;
         for each(_loc1_ in this._0L_B_)
         {
            _loc1_.selected.remove(this._1Q_3);
            _loc1_.destroy();
         }
      }
      
      public function _os() : void
      {
         this._0S_K_(this.selected._1A_v()._0kz());
      }
      
      private function onCloseClick(param1:MouseEvent) : void
      {
         this.close.dispatch();
      }
      
      private function _1Q_3(param1:_1U_P_._G_) : void
      {
         this.selected.setSelected(false);
         this.selected = param1;
         this.selected.setSelected(true);
         this._e4.visible = param1._1A_v().getKey() == "weekly";
         if(param1._1A_v()._19W_())
         {
            this.list.setItems(param1._1A_v()._0kz(),true);
         }
         else
         {
            this._1mn.dispatch(param1._1A_v());
         }
      }
      
      public function _0S_K_(param1:Vector.<_083>) : void
      {
         this.list.setItems(param1,true);
      }
      
      private function _kw() : Vector.<_1U_P_._G_>
      {
         var _loc1_:_11o = null;
         var _loc2_:_1U_P_._G_ = null;
         var _loc3_:_1S_m = null;
         _loc3_ = new _1S_m();
         var _loc4_:Vector.<_1U_P_._G_> = new Vector.<_1U_P_._G_>();
         for each(_loc1_ in _160._021)
         {
            _loc2_ = new _1U_P_._G_(_loc1_);
            _loc2_.y = 70;
            _loc2_.selected.add(this._1Q_3);
            _loc4_.push(_loc2_);
            _loc3_.push(_loc2_._0zZ_);
            addChild(_loc2_);
         }
         _loc3_.complete.addOnce(this._z1);
         return _loc4_;
      }
      
      private function _iV_(param1:Boolean) : Bitmap
      {
         var _loc2_:BitmapData = TextureRedrawer.redraw(TextureLibrary.getBitmap("lofiInterface2",8),64,true,0,true);
         if(param1)
         {
            _loc2_ = BitmapUtil.mirror(_loc2_);
         }
         return new Bitmap(_loc2_);
      }
      
      private function _1lN_() : _I_a
      {
         var _loc1_:_I_a = null;
         _loc1_ = new _I_a();
         _loc1_.setBold(true).setColor(11776947).setSize(32);
         _loc1_.filters = [new DropShadowFilter(0,0,0,1,8,8)];
         _loc1_.setStringBuilder(new _dU_().setParams(_1O_I_._0v__));
         _loc1_.setAutoSize(TextFieldAutoSize.CENTER);
         _loc1_.y = 25;
         _loc1_.textChanged.addOnce(this._0H_4);
         return _loc1_;
      }
      
      private function _C_r() : void
      {
         this._1D_r = new TextButton(_1O_I_._1W_T_,36,false);
         this._1D_r.setAutoSize(TextFieldAutoSize.CENTER);
         this._1D_r.setVerticalAlign(SimpleText.MIDDLE);
         this._1D_r.x = 400;
         this._1D_r.y = 553;
         addChild(this._1D_r);
         this._1D_r.addEventListener(MouseEvent.CLICK,this.onCloseClick);
      }
      
      private function _0t2() : void
      {
         var _loc1_:Shape = new Shape();
         addChild(_loc1_);
         var _loc2_:Graphics = _loc1_.graphics;
         _loc2_.lineStyle(2,5526612);
         _loc2_.moveTo(0,100);
         _loc2_.lineTo(800,100);
      }
      
      private function _10d() : _1U_P_._0K_6
      {
         var _loc1_:_1U_P_._0K_6 = null;
         _loc1_ = new _1U_P_._0K_6();
         _loc1_.x = 15;
         _loc1_.y = 115;
         return _loc1_;
      }
      
      private function _z1() : void
      {
         var _loc1_:_1U_P_._G_ = null;
         var _loc2_:int = 0;
         _loc2_ = 20;
         for each(_loc1_ in this._0L_B_)
         {
            _loc1_.x = _loc2_;
            _loc2_ = _loc2_ + (_loc1_.width + 20);
         }
      }
      
      private function _1M_H_() : _0e5
      {
         var _loc1_:_0e5 = null;
         _loc1_ = new _0e5();
         _loc1_.y = 72;
         _loc1_.x = 440;
         return _loc1_;
      }
      
      private function _0H_4() : void
      {
         stage;
         this.title.x = 800 / 2;
         stage;
         this._0bu.x = 800 / 2 - this.title.width / 2 - this._0bu.width + 10;
         this._0bu.y = 15;
         stage;
         this._1mN_.x = 800 / 2 + this.title.width / 2 - 10;
         this._1mN_.y = 15;
      }
   }
}
