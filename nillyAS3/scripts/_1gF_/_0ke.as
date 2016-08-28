package _1gF_
{
   import flash.filters.GlowFilter;
   import flash.display.BitmapData;
   import _1xa._1eo;
   import flash.geom.Matrix;
   import flash.text.TextFieldAutoSize;
   import com.company.util.PointUtil;
   import _C_._0C_J_;
   import _C_._Q_E_;
   
   public class _0ke
   {
       
      
      private const _0W___:GlowFilter = new GlowFilter(0,1,3,3,2,1);
      
      public var padding:int = 0;
      
      private var _16N_:_1gF_.SimpleText;
      
      public function _0ke(param1:_0C_J_, param2:_Q_E_)
      {
         super();
         this._16N_ = new _1gF_.SimpleText();
         this._16N_._J_(param1._7X_());
         this._16N_._7D_(param2._17P_());
         this._16N_._0L_b(param2._1s9());
      }
      
      public function make(param1:_1eo, param2:int, param3:uint, param4:Boolean, param5:Matrix, param6:Boolean) : BitmapData
      {
         this._0C_E_(param2,param3,param4,param1);
         return this._1fV_(param6,param5);
      }
      
      private function _0C_E_(param1:int, param2:uint, param3:Boolean, param4:_1eo) : void
      {
         this._16N_.setSize(param1).setColor(param2).setBold(param3).setAutoSize(TextFieldAutoSize.LEFT);
         this._16N_.setStringBuilder(param4);
      }
      
      private function _1fV_(param1:Boolean, param2:Matrix) : BitmapData
      {
         var _loc3_:int = this._16N_.width + this.padding + param2.tx;
         var _loc4_:int = this._16N_.height + this.padding;
         var _loc5_:BitmapData = new _1wr(_loc3_,_loc4_,true,0);
         _loc5_.draw(this._16N_,param2);
         param1 && _loc5_.applyFilter(_loc5_,_loc5_.rect,PointUtil._17Q_,this._0W___);
         return _loc5_;
      }
   }
}
