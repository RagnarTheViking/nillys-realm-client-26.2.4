package _1cV_
{
   final class _J_o
   {
       
      
      private var _1Q_E_:Vector.<String>;
      
      private var index:int;
      
      function _J_o()
      {
         super();
         this._1Q_E_ = new Vector.<String>();
         this.index = 0;
      }
      
      public function add(param1:String) : void
      {
         this.index = this._1Q_E_.push(param1);
      }
      
      public function get length() : int
      {
         return this._1Q_E_.length;
      }
      
      public function _0yY_() : String
      {
         return this.index > 0?this._1Q_E_[--this.index]:"";
      }
      
      public function _0G_r() : String
      {
         return this.index < this._1Q_E_.length - 1?this._1Q_E_[++this.index]:"";
      }
   }
}
