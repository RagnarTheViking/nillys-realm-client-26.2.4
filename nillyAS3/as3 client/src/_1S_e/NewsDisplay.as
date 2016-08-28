package _1S_e
{
   import flash.display.Sprite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import _1gF_.SimpleText;
   import flash.events.MouseEvent;
   import _0H_6.GameContext;
   import _3b.DialogSignal;
   import _bv._19k;
   import _ll.SFX;
   import flash.geom.Rectangle;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.util.TextureLibrary;
   import _T_E_._0Z_v;
   import _1xa.SText;
   import flash.filters.DropShadowFilter;
   
   public class NewsDisplay extends Sprite
   {
      
      public static const _U_1:String = "lofiObj2";
      
      public static const _1qM_:int = 345;
      
      public static var _V_A_:Boolean = false;
       
      
      private var _1t6:Bitmap;
      
      private var background:Sprite;
      
      private var background2:Sprite;
      
      private var icon:BitmapData;
      
      private var text:SimpleText;
      
      public function NewsDisplay()
      {
         var _loc1_:Rectangle = null;
         super();
         mouseChildren = false;
         this.icon = TextureRedrawer.redraw(TextureLibrary.getBitmap(_U_1,_1qM_),40,true,0);
         this._1t6 = new Bitmap(this.icon);
         this._1t6.x = -5;
         this._1t6.y = -8;
         this.background = _0Z_v._1P_T_();
         this.background2 = _0Z_v._1F_X_(31,_0Z_v._0dM_);
         this.text = new SimpleText().setSize(16).setColor(16777215);
         this.text.setStringBuilder(new SText("Update!"));
         this.text.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         this.text.setVerticalAlign(SimpleText.BOTTOM);
         this._16X_();
         _loc1_ = this._1t6.getBounds(this);
         var _loc2_:int = 10;
         this.text.x = _loc1_.right - _loc2_;
         this.text.y = _loc1_.bottom - _loc2_;
         addEventListener(MouseEvent.CLICK,this._1k9);
      }
      
      public function _1k9(param1:MouseEvent) : void
      {
         var _loc2_:DialogSignal = GameContext.getInjector().getInstance(DialogSignal);
         _loc2_.dispatch(new _19k());
         SFX.play("button_click");
      }
      
      public function _16X_() : void
      {
         if(_19k._1wT_())
         {
            _V_A_ = true;
            addChild(this.background);
            addChild(this.text);
         }
         else
         {
            _V_A_ = false;
            addChild(this.background2);
         }
         addChild(this._1t6);
      }
   }
}
