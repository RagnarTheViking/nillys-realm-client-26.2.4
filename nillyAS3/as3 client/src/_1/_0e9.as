package _1
{
   import _f7.Signal;
   import _f7._15B_;
   
   public class _0e9 extends Signal
   {
       
      
      private var data:Array;
      
      private var log:Boolean = true;
      
      public function _0e9(... rest)
      {
         this.data = [];
         super(rest);
      }
      
      override public function dispatch(... rest) : void
      {
         if(this.log)
         {
            this.data.push(rest);
         }
         super.dispatch.apply(this,rest);
      }
      
      override public function add(param1:Function) : _15B_
      {
         var _loc2_:_15B_ = super.add(param1);
         while(this.data.length > 0)
         {
            param1.apply(this,this.data.shift());
         }
         this.log = false;
         return _loc2_;
      }
      
      override public function addOnce(param1:Function) : _15B_
      {
         var _loc2_:_15B_ = null;
         if(this.data.length > 0)
         {
            param1.apply(this,this.data.shift());
         }
         else
         {
            _loc2_ = super.addOnce(param1);
            this.log = false;
         }
         while(this.data.length > 0)
         {
            this.data.shift();
         }
         return _loc2_;
      }
      
      public function _iW_() : int
      {
         return this.data.length;
      }
   }
}
