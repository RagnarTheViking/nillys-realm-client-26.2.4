package ToolTips
{
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.ui._1vJ_;
   import _1gF_.SimpleText;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   
   public class _1D_l extends ToolTip
   {
       
      
      public var _06v:Vector.<Player> = null;
      
      private var _dY_:Vector.<_1vJ_>;
      
      private var _O_I_:SimpleText;
      
      public function _1D_l(param1:Vector.<Player>, param2:Boolean = true)
      {
         this._dY_ = new Vector.<_1vJ_>();
         super(3552822,0.5,16777215,1,param2);
         this._O_I_ = new SimpleText().setSize(12).setColor(11776947);
         this._O_I_.setStringBuilder(new _dU_().setParams(_1O_I_._x3));
         this._O_I_.filters = [new DropShadowFilter(0,0,0)];
         addChild(this._O_I_);
         this._1wJ_(param1);
         if(!param2)
         {
            filters = [];
         }
         _01T_.push(this._O_I_.textChanged);
      }
      
      public function _1wJ_(param1:Vector.<Player>) : void
      {
         var _loc2_:Player = null;
         var _loc3_:_1vJ_ = null;
         var _loc4_:int = 0;
         this.clear();
         this._06v = param1.slice();
         if(this._06v == null || this._06v.length == 0)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            _loc3_ = new _1vJ_(11776947,true,_loc2_);
            _loc3_.x = 0;
            _loc3_.y = _loc4_;
            addChild(_loc3_);
            this._dY_.push(_loc3_);
            _loc4_ = _loc4_ + 32;
         }
         this._O_I_.x = width / 2 - this._O_I_.width / 2;
         this._O_I_.y = _loc4_;
         draw();
      }
      
      private function clear() : void
      {
         var _loc1_:_1vJ_ = null;
         graphics.clear();
         for each(_loc1_ in this._dY_)
         {
            removeChild(_loc1_);
         }
         this._dY_.length = 0;
      }
   }
}
