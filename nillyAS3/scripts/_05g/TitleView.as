package _05g
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import _ju._0G_n;
   import _S_b.ClientDetails;
   import _f7.Signal;
   import _W_Q_.TextButton;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import _1xa.SText;
   import Settings.App;
   import _ju._b4;
   import _W_Q_.TitleBasicAccountInfo;
   import com.company.assembleegameclient.ui._0xD_;
   
   public class TitleView extends Sprite
   {
      
      public static const _1G_3:Number = 589.45;
      
      static var _A_n:Class = TitleScreen;
      
      public static var _03E_:Boolean = false;
      
      public static var _16I_:Boolean = false;
      
      public static var _9G_:Boolean = false;
      
      public static var _0kb:Boolean = false;
       
      
      private var _1O_L_:SimpleText;
      
      private var _M_5:SimpleText;
      
      private var _4S_:_0G_n;
      
      private var data:ClientDetails;
      
      public var _T_A_:Signal;
      
      public var _Z_b:Signal;
      
      public var _cy:Signal;
      
      public var _1or:Signal;
      
      public var _17u:Signal;
      
      public var _1I_I_:Signal;
      
      public var _0H_U_:Signal;
      
      public var _xN_:Signal;
      
      public var _T_7:Signal;
      
      public function TitleView()
      {
         this._4S_ = this._oF_();
         this._T_7 = new Signal();
         super();
         addChild(new _b4());
         addChild(new _A_n());
         addChild(this._4S_);
         addChild(new TitleBasicAccountInfo());
         this._4J_();
         addChild(new _0xD_());
      }
      
      private function _oF_() : _0G_n
      {
         var _loc1_:TextButton = _0D_3._1__U_();
         var _loc2_:TextButton = _0D_3._1B_I_();
         var _loc3_:TextButton = _0D_3._1N_Y_();
         var _loc4_:TextButton = _0D_3._04O_();
         var _loc5_:TextButton = _0D_3._0__D_();
         _loc5_.setColor(16753920);
         this._T_A_ = _loc1_.clicked;
         this._Z_b = _loc2_.clicked;
         this._cy = _loc3_.clicked;
         this._1or = _loc4_.clicked;
         this._1I_I_ = _loc5_.clicked;
         var _loc6_:_0G_n = new _0G_n();
         _loc6_._19d(_loc1_,_0G_n.CENTER);
         _loc6_._19d(_loc2_,_0G_n.LEFT);
         _loc6_._19d(_loc5_,_0G_n.LEFT);
         _loc6_._19d(_loc3_,_0G_n.RIGHT);
         _loc6_._19d(_loc4_,_0G_n.RIGHT);
         return _loc6_;
      }
      
      private function _4J_() : void
      {
         this._1O_L_ = this.makeText().setHTML(true).setAutoSize(TextFieldAutoSize.LEFT).setVerticalAlign(SimpleText.MIDDLE);
         this._1O_L_.y = _1G_3;
         addChild(this._1O_L_);
         this._M_5 = this.makeText().setAutoSize(TextFieldAutoSize.RIGHT).setVerticalAlign(SimpleText.MIDDLE);
         this._M_5.setStringBuilder(new _dU_().setParams(_1O_I_._0X_K_));
         this._M_5.filters = [new DropShadowFilter(0,0,0)];
         this._M_5.x = 800;
         this._M_5.y = _1G_3;
         addChild(this._M_5);
      }
      
      public function makeText() : SimpleText
      {
         var _loc1_:SimpleText = new SimpleText().setSize(12).setColor(8355711);
         _loc1_.filters = [new DropShadowFilter(0,0,0)];
         return _loc1_;
      }
      
      public function initialize(param1:ClientDetails) : void
      {
         this.data = param1;
         this._D_g();
         this._1X_r();
      }
      
      private function _D_g() : void
      {
         this._1O_L_.setStringBuilder(new SText(this.data.name));
      }
      
      private function _1X_r() : void
      {
         if(this.data.rank >= App.getProperty("EditorMinRank"))
         {
            this.showEditor();
         }
         this.data.isDesktop && this._1X_2();
         this._T_7.dispatch();
      }
      
      private function _1X_2() : void
      {
         var _loc1_:TextButton = _0D_3._0R_1();
         this._4S_._19d(_loc1_,_0G_n.RIGHT);
         this._xN_ = _loc1_.clicked;
      }
      
      private function showEditor() : void
      {
         var _loc1_:TextButton = _0D_3._0hK_();
         this._4S_._19d(_loc1_,_0G_n.RIGHT);
         _loc1_.setColor(31655);
         this._0H_U_ = _loc1_.clicked;
      }
   }
}
