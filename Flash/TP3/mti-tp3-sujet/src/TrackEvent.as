package
{
    import flash.events.Event;
    
    public class TrackEvent extends Event
    {
        public static const SELECTED  : String    = 'trackSelected';
        
        private var _url        : String;
        
        public function get url() : String
        {
            return _url;
        }
        public function set url(value : String) : void
        {
            _url = value;
        }
        
        public function TrackEvent(type : String)
        {
            super(type);
        }
    }
}