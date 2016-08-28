package com.company.assembleegameclient.ui
{
   import _1R_o._Y_5;
   import flash.geom.Matrix;
   import _1R_o._0xf;
   import flash.display.Shape;
   import flash.display.GraphicsSolidFill;
   import flash.display.GraphicsStroke;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import _1gF_._0ke;
   import flash.geom.Point;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import com.company.util._mL_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _1xa.SText;
   import com.company.util.GraphicHelper;
   import _1T_4._q6;
   import _1T_4._1K_2;
   import com.company.assembleegameclient.objects.Player;
   import _0qE_._016;
   import flash.display.LineScaleMode;
   import flash.display.CapsStyle;
   import flash.display.JointStyle;
   import com.company.util.MoreColorUtil;
   
   public class _1o2 extends Slot implements _Y_5
   {
      
      private static const _0L_P_:Matrix = new Matrix();
      
      public static const _052:int = -1;
      
      private static const _1A_f:Matrix = _1Z_p();
       
      
      public const _18D_:_0xf = new _0xf();
      
      public var included_:Boolean;
      
      public var _yS_:com.company.assembleegameclient.ui._pJ_;
      
      private var id:uint;
      
      private var item_:int;
      
      private var _09c:Shape;
      
      private var _06r:GraphicsSolidFill;
      
      private var _0pt:GraphicsStroke;
      
      private var _O_b:GraphicsPath;
      
      private var graphicsData_:Vector.<IGraphicsData>;
      
      private var _19e:_0ke;
      
      public function _1o2(param1:int, param2:Boolean, param3:Boolean, param4:int, param5:int, param6:Array, param7:uint)
      {
         this._yS_ = new com.company.assembleegameclient.ui._pJ_();
         this._06r = new GraphicsSolidFill(16711310,1);
         this._0pt = new GraphicsStroke(2,false,LineScaleMode.NORMAL,CapsStyle.NONE,JointStyle.ROUND,3,this._06r);
         this._O_b = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this.graphicsData_ = new <IGraphicsData>[this._0pt,this._O_b,GraphicHelper._1yz];
         super(param4,param5,param6);
         this.id = param7;
         this.item_ = param1;
         this.included_ = param3;
         this._0T_L_();
         if(!param2)
         {
            transform.colorTransform = MoreColorUtil._S_I_;
         }
         this._09c = this._R_t();
         addChild(this._09c);
         this.setIncluded(param3);
         this._18D_._bD_(this);
      }
      
      private static function _1Z_p() : Matrix
      {
         var _loc1_:Matrix = new Matrix();
         _loc1_.translate(10,5);
         return _loc1_;
      }
      
      private function _0T_L_() : void
      {
         if(!this.isEmpty())
         {
            this._1W_6();
         }
      }
      
      private function _1W_6() : void
      {
         var _loc1_:Point = null;
         var _loc2_:Bitmap = null;
         var _loc3_:BitmapData = null;
         _mL_._0g1(this,_jj);
         var _loc4_:BitmapData = ObjectLibrary.getRedrawnTextureFromType(this.item_,80,true);
         var _loc5_:XML = ObjectLibrary.XmlData[this.item_];
         if(_loc5_.hasOwnProperty("Doses") && this._19e)
         {
            _loc4_ = _loc4_.clone();
            _loc3_ = this._19e.make(new SText(String(_loc5_.Doses)),12,16777215,false,_0L_P_,false);
            _loc4_.draw(_loc3_,_1A_f);
         }
         _loc1_ = _01X_(this.item_,type_,false);
         _loc2_ = new Bitmap(_loc4_);
         _loc2_.x = WIDTH / 2 - _loc2_.width / 2 + _loc1_.x;
         _loc2_.y = HEIGHT / 2 - _loc2_.height / 2 + _loc1_.y;
         _mL_._1D_5(this,_loc2_);
      }
      
      public function setIncluded(param1:Boolean) : void
      {
         this.included_ = param1;
         this._09c.visible = this.included_;
         if(this.included_)
         {
            _W_F_.color = 16764247;
         }
         else
         {
            _W_F_.color = 5526612;
         }
         _1W_A_();
      }
      
      public function _0U_A_(param1:_0ke) : void
      {
         this._19e = param1;
         this._0T_L_();
      }
      
      private function _R_t() : Shape
      {
         var _loc1_:Shape = new Shape();
         GraphicHelper.clearGraphicsPath(this._O_b);
         GraphicHelper.drawUi(0,0,WIDTH,HEIGHT,4,_0c6,this._O_b);
         _loc1_.graphics.drawGraphicsData(this.graphicsData_);
         return _loc1_;
      }
      
      public function _0A_A_(param1:_q6) : void
      {
         this._18D_._0A_A_(param1);
      }
      
      public function _23() : _q6
      {
         return this._18D_._23();
      }
      
      public function _0hm(param1:_1K_2) : void
      {
         this._18D_._0hm(param1);
      }
      
      public function _fn() : _1K_2
      {
         return this._18D_._fn();
      }
      
      public function _1ib(param1:Player) : void
      {
         if(!this.isEmpty())
         {
            this._18D_.tooltip = this._yS_.make(this.item_,param1,-1,_016.OTHER_PLAYER,this.id);
         }
      }
      
      public function isEmpty() : Boolean
      {
         return this.item_ == _052;
      }
   }
}
