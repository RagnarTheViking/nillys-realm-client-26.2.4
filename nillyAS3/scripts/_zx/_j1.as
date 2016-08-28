package _zx
{
   public class _j1 implements _L_s
   {
      
      public static var _1t1:Class = _0ei;
       
      
      private var _03l:Vector.<String>;
      
      private var _1M_1:Vector.<int>;
      
      private var index:int;
      
      private var count:int;
      
      public function _j1()
      {
         super();
         this.index = 0;
         this._0i();
         this.count = this._03l.length;
         this._op();
      }
      
      public function _1pJ_() : String
      {
         var _loc1_:int = this._1M_1[this.index++ % this.count];
         return this._03l[_loc1_];
      }
      
      private function _0i() : void
      {
         var _loc1_:XML = null;
         var _loc2_:XML = XML(new _1t1());
         this._03l = new Vector.<String>(0);
         for each(_loc1_ in _loc2_.Protip)
         {
            this._03l.push(_loc1_.toString());
         }
         this.count = this._03l.length;
      }
      
      private function _op() : void
      {
         var _loc2_:int = 0;
         var _loc1_:Vector.<int> = new Vector.<int>(0);
         while(_loc2_ < this.count)
         {
            _loc1_.push(_loc2_);
            _loc2_++;
         }
         this._1M_1 = new Vector.<int>(0);
         while(_loc2_ > 0)
         {
            this._1M_1.push(_loc1_.splice(Math.floor(Math.random() * _loc2_--),1)[0]);
         }
         this._1M_1.fixed = true;
      }
   }
}
