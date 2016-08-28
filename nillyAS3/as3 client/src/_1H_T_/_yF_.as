package _1H_T_
{
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.filters.ColorMatrixFilter;
   import flash.display.Bitmap;
   import _1gF_._0ke;
   import flash.display.BitmapData;
   import _1pm._0P_M_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import _1xa.SText;
   
   public class _yF_ extends Sprite
   {
      
      protected static const _1xJ_:Array = [new ColorMatrixFilter([0.4,0,0,0,0,0,0.4,0,0,0,0,0,0.4,0,0,0,0,0,1,0])];
      
      private static const _0L_P_:Matrix = new Matrix();
      
      private static const _1A_f:Matrix = function():Matrix
      {
         var _loc1_:* = new Matrix();
         _loc1_.translate(10,5);
         return _loc1_;
      }();
       
      
      public var itemId:int;
      
      public var _7v:Bitmap;
      
      private var _19e:_0ke;
      
      public function _yF_()
      {
         super();
         this._7v = new Bitmap();
         addChild(this._7v);
         this.itemId = -1;
      }
      
      public function setDim(param1:Boolean) : void
      {
         filters = !!param1?_1xJ_:null;
      }
      
      public function setType(param1:int) : void
      {
         this.itemId = param1;
         this._0U_0();
      }
      
      public function _0U_0() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:XML = null;
         var _loc3_:BitmapData = null;
         if(this.itemId != _0P_M_._F_p)
         {
            _loc1_ = ObjectLibrary.getRedrawnTextureFromType(this.itemId,80,true);
            _loc2_ = ObjectLibrary.XmlData[this.itemId];
            if(_loc2_ && _loc2_.hasOwnProperty("Doses") && this._19e)
            {
               _loc1_ = _loc1_.clone();
               _loc3_ = this._19e.make(new SText(String(_loc2_.Doses)),12,16777215,false,_0L_P_,false);
               _loc1_.draw(_loc3_,_1A_f);
            }
            this._7v.bitmapData = _loc1_;
            this._7v.x = -_loc1_.width / 2;
            this._7v.y = -_loc1_.height / 2;
            visible = true;
         }
         else
         {
            visible = false;
         }
      }
      
      public function _0U_A_(param1:_0ke) : void
      {
         this._19e = param1;
      }
   }
}
