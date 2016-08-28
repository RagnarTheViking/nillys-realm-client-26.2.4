package _04m
{
   public class _kN_
   {
       
      
      private const map:Object = {};
      
      private var timespan:_04m.Timespan;
      
      public function _kN_()
      {
         this.timespan = _04m.Timespan._0tf;
         super();
      }
      
      public function _1pG_() : _04m.Timespan
      {
         return this.timespan;
      }
      
      public function _05P_(param1:_04m.Timespan) : void
      {
         this.timespan = param1;
      }
      
      public function _1X_E_() : Boolean
      {
         return this.map[this.timespan._031()] != null;
      }
      
      public function _wb() : Vector.<_0dn>
      {
         return this.map[this.timespan._031()];
      }
      
      public function _1T_6(param1:Vector.<_0dn>) : void
      {
         this.map[this.timespan._031()] = param1;
      }
      
      public function clear() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in this.map)
         {
            this.dispose(this.map[_loc1_]);
            delete this.map[_loc1_];
         }
      }
      
      private function dispose(param1:Vector.<_0dn>) : void
      {
         var _loc2_:_0dn = null;
         for each(_loc2_ in param1)
         {
            _loc2_.character && this._0D_K_(_loc2_);
         }
      }
      
      private function _0D_K_(param1:_0dn) : void
      {
         param1.character.dispose();
         param1.character = null;
      }
   }
}
