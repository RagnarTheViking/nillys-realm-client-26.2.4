package _009
{
   public class _1G_z
   {
      
      static const _0H_L_:Array = new Array([-1588179810,-1929624738,1465805709,480327251,1594752807,-1870369590,-451833837,-1352309388,-35059665,775399424,-933227851,229443519,637101006,2012090288,457398381,-1561925419,-912011682,1968137293,-1871266776,-1502009639,911216768,-1310933448,-1934639638,-247544406,-1540905764,572147778,-1447885616,983716039],[-1170736391,-424545369,1440769887,1024116606,-1816669739,1917963832,1615098199,2057151397,2080684970,-235763965,-28086266,1157595756,831275692,-798174826,1511394520,1724754000,-1932052739,1142960245,631629805,1556997614,1803516080,502865182,895912016,-767876349]);
      
      static const _1vx:Array = new Array([1552940220,-1527546061,-1107173493,567410110],[66213975,1285611061,697629726,-1649052310]);
       
      
      public function _1G_z()
      {
         super();
      }
      
      public static function _06k(param1:int, param2:int) : String
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = undefined;
         var _loc9_:* = undefined;
         _loc3_ = "";
         _loc4_ = 0;
         _loc5_ = _0H_L_[param1 - 5 ^ -391].length;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = int(_0H_L_[param1 - 5 ^ -391][_loc4_]);
            _loc4_++;
            _loc7_ = int(_0H_L_[param1 - 5 ^ -391][_loc4_]);
            _loc8_ = 2654435769;
            _loc9_ = 84941944608;
            while(_loc9_ != 0)
            {
               _loc7_ = _loc7_ - ((_loc6_ << 4 ^ _loc6_ >>> 5) + _loc6_ ^ _loc9_ + int(_1vx[param2 + 3 ^ -134][_loc9_ >>> 11 & 3]));
               _loc9_ = _loc9_ - _loc8_;
               _loc6_ = _loc6_ - ((_loc7_ << 4 ^ _loc7_ >>> 5) + _loc7_ ^ _loc9_ + int(_1vx[param2 + 3 ^ -134][_loc9_ & 3]));
            }
            _loc3_ = _loc3_ + (String.fromCharCode(_loc6_) + String.fromCharCode(_loc7_));
            _loc4_++;
         }
         if(_loc3_.charCodeAt(_loc3_.length - 1) == 0)
         {
            _loc3_ = _loc3_.substring(0,_loc3_.length - 1);
         }
         return _loc3_;
      }
   }
}
