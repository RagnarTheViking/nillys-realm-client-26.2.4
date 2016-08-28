package _T_n
{
   import _0qH_._0sZ_;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import kabam.rotmg.assets.services._157;
   import com.company.util.MoreColorUtil;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import _05g._1S_m;
   import flash.text.TextField;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.util.Currency;
   import com.company.util.GraphicHelper;
   import flash.events.MouseEvent;
   import flash.display.Graphics;
   import flash.display.GraphicsStroke;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.text.TextFieldAutoSize;
   
   public class _0J_s extends _0sZ_
   {
      
      private static const BEVEL:int = 4;
      
      private static const _0ci:int = 2;
      
      public static const _1nz:BitmapData = _157.makeCoin();
      
      public static const fortune:BitmapData = _157._0bt();
      
      public static const fame:BitmapData = _157._0rl();
      
      public static const _0uj:BitmapData = _157._Y_2();
      
      private static const _uY_:ColorMatrixFilter = new ColorMatrixFilter(MoreColorUtil._iz);
       
      
      private const _1jh:GraphicsSolidFill = new GraphicsSolidFill(16777215,1);
      
      private const _m9:GraphicsSolidFill = new GraphicsSolidFill(8355711,1);
      
      private const _1Q_F_:GraphicsPath = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
      
      private var graphicsData:Vector.<IGraphicsData>;
      
      private const _01T_:_1S_m = new _1S_m();
      
      public var _11P_:String;
      
      public var text:TextField;
      
      public var icon:Bitmap;
      
      public var price:int = -1;
      
      public var currency:int = -1;
      
      public var _1Y_4:int = -1;
      
      private var _0D_z:Boolean = false;
      
      private var _0fR_:int = 5526612;
      
      private var _F_K_:int = -1;
      
      private var _0T___:int = -1;
      
      private var _lJ_:int = 4;
      
      public function _0J_s(param1:String, param2:int, param3:int, param4:Boolean = false)
      {
         super();
         this._11P_ = param1;
         this.text = new TextField();
         var _loc5_:TextFormat = new TextFormat();
         _loc5_.size = 16;
         _loc5_.font = "Myriad Pr";
         _loc5_.bold = true;
         _loc5_.align = TextFormatAlign.LEFT;
         _loc5_.leftMargin = 0;
         _loc5_.indent = 0;
         _loc5_.leading = 0;
         this.text.textColor = 3552822;
         this.text.autoSize = TextFieldAutoSize.CENTER;
         this.text.selectable = false;
         this.text.defaultTextFormat = _loc5_;
         this.text.setTextFormat(_loc5_);
         this._01T_.complete.add(this._dA_);
         this._01T_.complete.addOnce(this._0R_p);
         addChild(this.text);
         this.icon = new Bitmap();
         addChild(this.icon);
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         addEventListener(MouseEvent.ROLL_OUT,this.onRollOut);
         this.setPrice(param2,param3);
         this._0D_z = param4;
         this.graphicsData = new <IGraphicsData>[this._1jh,this._1Q_F_,GraphicHelper.END_FILL];
      }
      
      override public function setPrice(param1:int, param2:int) : void
      {
         if(this.price != param1 || this.currency != param2)
         {
            this.price = param1;
            this.currency = param2;
            this.text.text = this._11P_ + param1.toString();
            this._dA_();
         }
      }
      
      public function _1Z_J_() : int
      {
         return this.price;
      }
      
      public function _0D_S_(param1:String) : void
      {
         this.text.text = param1;
         this._dA_();
      }
      
      override public function setEnabled(param1:Boolean) : void
      {
         if(param1 != mouseEnabled)
         {
            mouseEnabled = param1;
            filters = !!param1?[]:[_uY_];
            this.draw();
         }
      }
      
      override public function setWidth(param1:int) : void
      {
         this._1Y_4 = param1;
         this._dA_();
      }
      
      private function _dA_() : void
      {
         this._13O_();
         this._0U_a();
         this._o__();
         this.draw();
      }
      
      private function _0R_p() : void
      {
         this._dA_();
         _0T_g.dispatch();
      }
      
      private function _0U_a() : void
      {
         switch(this.currency)
         {
            case Currency.GOLD:
               this.icon.bitmapData = _1nz;
               break;
            case Currency.FAME:
               this.icon.bitmapData = fame;
               break;
            case Currency.GUILD_FAME:
               this.icon.bitmapData = _0uj;
               break;
            case Currency.TOKEN:
               this.icon.bitmapData = fortune;
               break;
            default:
               this.icon.bitmapData = null;
         }
         this._079();
      }
      
      private function _o__() : void
      {
         GraphicHelper.clearGraphicsPath(this._1Q_F_);
         GraphicHelper.drawUi(0,0,this._0Z_U_(),this.getHeight(),BEVEL,[1,1,1,1],this._1Q_F_);
      }
      
      private function _13O_() : void
      {
         this.text.x = (this._0Z_U_() - this.icon.width - this.text.width - _0ci) * 0.5;
         this.text.y = this._lJ_;
      }
      
      private function _079() : void
      {
         this.icon.x = this.text.x + this.text.width + _0ci;
         this.icon.y = (this.getHeight() - this.icon.height - 1) * 0.5;
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._1jh.color = 16768133;
         this.draw();
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this._1jh.color = 16777215;
         this.draw();
      }
      
      public function draw() : void
      {
         this.graphicsData[0] = !!mouseEnabled?this._1jh:this._m9;
         graphics.clear();
         graphics.drawGraphicsData(this.graphicsData);
         if(this._0D_z)
         {
            this._1f3(graphics);
         }
      }
      
      private function _0Z_U_() : int
      {
         return this._F_K_ != -1?int(this._F_K_):int(Math.max(this._1Y_4,this.text.width + this.icon.width + 3 * _0ci));
      }
      
      private function getHeight() : int
      {
         return this._0T___ != -1?int(this._0T___):int(this.text.height + this._lJ_ * 2);
      }
      
      public function _1bF_() : void
      {
         this._0T___ = this.getHeight();
         this._F_K_ = this._0Z_U_();
      }
      
      public function _1o() : void
      {
         this._0T___ = -1;
         this._F_K_ = -1;
      }
      
      public function _iv(param1:Number) : void
      {
         this._F_K_ = this._0Z_U_() * param1;
         this._dA_();
      }
      
      public function _X_(param1:Number) : void
      {
         this._lJ_ = this._lJ_ * param1;
         this._dA_();
      }
      
      public function _00Y_(param1:int) : void
      {
         this._0fR_ = param1;
      }
      
      private function _1f3(param1:Graphics) : void
      {
         var _loc2_:GraphicsSolidFill = new GraphicsSolidFill(0,0.01);
         var _loc3_:GraphicsSolidFill = new GraphicsSolidFill(this._0fR_,0.6);
         var _loc4_:GraphicsStroke = new GraphicsStroke(4,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,_loc3_);
         var _loc5_:GraphicsPath = new GraphicsPath();
         GraphicHelper.drawUi(0,0,this._0Z_U_(),this.getHeight(),4,GraphicHelper._nw,_loc5_);
         var _loc6_:Vector.<IGraphicsData> = new <IGraphicsData>[_loc4_,_loc2_,_loc5_,GraphicHelper.END_FILL,GraphicHelper._1yz];
         param1.drawGraphicsData(_loc6_);
      }
   }
}
