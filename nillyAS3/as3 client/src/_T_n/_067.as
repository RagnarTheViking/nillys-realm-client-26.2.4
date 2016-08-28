package _T_n
{
   import flash.display.Sprite;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import kabam.rotmg.assets.services._157;
   import com.company.util.MoreColorUtil;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import _05g._1S_m;
   import _1gF_.SimpleText;
   import _1xa.SText;
   import _1xa._dU_;
   import flash.display.Bitmap;
   import com.company.util.GraphicHelper;
   import com.company.assembleegameclient.util.Currency;
   import _1xa._1eo;
   
   public class _067 extends Sprite
   {
      
      private static const BEVEL:int = 4;
      
      private static const _0ci:int = 2;
      
      public static const _1nz:BitmapData = _157.makeCoin();
      
      public static const fame:BitmapData = _157._0rl();
      
      public static const _0uj:BitmapData = _157._Y_2();
      
      private static const _uY_:ColorMatrixFilter = new ColorMatrixFilter(MoreColorUtil._iz);
       
      
      private const _1jh:GraphicsSolidFill = new GraphicsSolidFill(16777215,1);
      
      private const _m9:GraphicsSolidFill = new GraphicsSolidFill(8355711,1);
      
      private const _1Q_F_:GraphicsPath = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
      
      private var graphicsData:Vector.<IGraphicsData>;
      
      private const _01T_:_1S_m = new _1S_m();
      
      public var _11P_:String;
      
      public var text:SimpleText;
      
      private var _0bB_:SText;
      
      private var _10T_:_dU_;
      
      public var icon:Bitmap;
      
      public var price:int = -1;
      
      public var currency:int = -1;
      
      public var _1Y_4:int = -1;
      
      private var _1N_v:Number = 100;
      
      private var _1V_m:Number = 100;
      
      public function _067(param1:Number, param2:Number)
      {
         this._0bB_ = new SText("");
         this._10T_ = new _dU_();
         this.graphicsData = new <IGraphicsData>[this._1jh,this._1Q_F_,GraphicHelper.END_FILL];
         super();
         this._11P_ = "   ";
         this._1N_v = param1;
         this._1V_m = param2;
         this.price = 1;
         this.currency = Currency.GOLD;
         this.text = new SimpleText().setSize(param1).setColor(3552822).setBold(true);
         this._01T_.push(this.text.textChanged);
         var _loc3_:_1eo = this._11P_ != ""?this._10T_.setParams(this._11P_,{"cost":this.price.toString()}):this._0bB_.setString(this.price.toString());
         this.text.setStringBuilder(_loc3_);
         this._01T_.complete.add(this._dA_);
         addChild(this.text);
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         if(param1 != mouseEnabled)
         {
            mouseEnabled = param1;
            filters = !!param1?[]:[_uY_];
            this.draw();
         }
      }
      
      private function _dA_() : void
      {
         this._o__();
         this.draw();
      }
      
      private function _o__() : void
      {
         GraphicHelper.clearGraphicsPath(this._1Q_F_);
         GraphicHelper.drawUi(0,0,this._0Z_U_(),this.getHeight(),BEVEL,[1,1,1,1],this._1Q_F_);
      }
      
      private function draw() : void
      {
         this.graphicsData[0] = !!mouseEnabled?this._1jh:this._m9;
         graphics.clear();
         graphics.drawGraphicsData(this.graphicsData);
      }
      
      private function _0Z_U_() : int
      {
         return this._1N_v;
      }
      
      private function getHeight() : int
      {
         return this._1V_m;
      }
   }
}
