package _1xa
{
   import _03U_._1U_N_;
   
   public class _4l implements _1eo
   {
       
      
      private const _S_P_:RegExp = /(\{([^\{]+?)\})/gi;
      
      private var _e0:String = "";
      
      private var _1vx:Array;
      
      private var provider:_1U_N_;
      
      public function _4l()
      {
         super();
      }
      
      public function setPattern(param1:String) : _4l
      {
         this._e0 = param1;
         return this;
      }
      
      public function _0L_b(param1:_1U_N_) : void
      {
         this.provider = param1;
      }
      
      public function getString() : String
      {
         var _loc1_:String = null;
         this._1vx = this._e0.match(this._S_P_);
         var _loc2_:String = this._e0;
         for each(_loc1_ in this._1vx)
         {
            _loc2_ = _loc2_.replace(_loc1_,this.provider.getValue(_loc1_.substr(1,_loc1_.length - 2)));
         }
         return _loc2_.replace(/\\n/g,"\n");
      }
   }
}
