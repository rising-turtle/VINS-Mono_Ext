function varargout = summarizeAsNonlinearContainer(varargin)
if length(varargin) == 3 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values') && isa(varargin{3},'gtsam.KeySet')
    varargout{1} = gtsam_wrapper(2155, varargin{:});
else
    error('Arguments do not match any overload of function gtsam.summarizeAsNonlinearContainer');
end
