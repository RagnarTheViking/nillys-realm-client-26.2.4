package _05L_
{
   public class _1uF_
   {
       
      
      private var _C_Z_:Vector.<String>;
      
      private var index:int = 0;
      
      public function _1uF_()
      {
         this._C_Z_ = new Vector.<String>();
         super();
      }
      
      public function push(param1:String) : void
      {
         var _loc2_:int = this._C_Z_.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._C_Z_.splice(_loc2_,1);
         }
         this._C_Z_.unshift(param1);
      }
      
      public function _0G_r() : String
      {
         if(this._C_Z_.length > 0)
         {
            this.index = (this.index + 1) % this._C_Z_.length;
            return this._C_Z_[this.index];
         }
         return "";
      }
      
      public function _W_M_() : void
      {
         this.index = -1;
      }
      
      public function _1pj() : void
      {
         this._C_Z_ = new Vector.<String>();
         this.index = 0;
      }
   }
}
