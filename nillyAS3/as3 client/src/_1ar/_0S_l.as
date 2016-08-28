package _1ar
{
   public class _0S_l
   {
       
      
      private var _5G_:Vector.<_1ar.Command>;
      
      public function _0S_l()
      {
         this._5G_ = new Vector.<_1ar.Command>();
         super();
      }
      
      public function _Z_0() : Boolean
      {
         return this._5G_.length == 0;
      }
      
      public function _0dm(param1:_1ar.Command) : void
      {
         this._5G_.push(param1);
      }
      
      public function execute() : void
      {
         var _loc1_:_1ar.Command = null;
         for each(_loc1_ in this._5G_)
         {
            _loc1_.execute();
         }
      }
      
      public function unexecute() : void
      {
         var _loc1_:_1ar.Command = null;
         for each(_loc1_ in this._5G_)
         {
            _loc1_.unexecute();
         }
      }
   }
}
